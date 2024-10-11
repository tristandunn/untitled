# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :redirect_authenticated_account, if: :signed_in?

  rate_limit to: 5, within: 1.hour, only: :create

  # Render the new account form.
  def new
    @form = AccountForm.new
  end

  # Create a new account.
  def create
    @form = AccountForm.new(account_parameters)

    if @form.save
      start_new_session_for(@form.account)

      redirect_authenticated_account
    else
      render :new
    end
  end

  protected

  # Return the expected parameters from the required account form parameter.
  #
  # @return [ActionController::Parameters]
  def account_parameters
    params.expect(account_form: %i(email password))
  end

  # Redirect to the root.
  #
  # @return [void]
  def redirect_authenticated_account
    redirect_to root_url
  end
end
