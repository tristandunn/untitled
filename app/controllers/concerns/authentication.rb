# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :signed_in?,
                  :signed_out?
  end

  # Deny access by redirecting to the root URL.
  #
  # @return [void]
  def access_denied
    redirect_to new_sessions_url
  end

  # Attempt to find an account from the account ID in the session.
  #
  # @return [Account, nil]
  def account_from_session
    if session[:account_id].present?
      Account.find_by(id: session[:account_id])
    end
  end

  # Resume the account session, otherwise deny access.
  #
  # @return [void]
  def authenticate
    resume_session || access_denied
  end

  # Attempt to set the current account from the session.
  #
  # @return [Account]
  def resume_session
    Current.account ||= account_from_session
  end

  # Determine if an account is signed in.
  #
  # @return [Boolean]
  def signed_in?
    resume_session.present?
  end

  # Determine if an account is not signed in.
  #
  # @return [Boolean]
  def signed_out?
    !signed_in?
  end

  # @return [void]
  def start_new_session_for(account)
    Current.account = account

    session[:account_id] = account.id
  end

  # @return [void]
  def terminate_session
    Current.account = nil

    session.delete(:account_id)
  end
end
