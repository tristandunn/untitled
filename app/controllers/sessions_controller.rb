# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_authenticated_account,
                except: :destroy,
                if:     :signed_in?

  rate_limit to: 1, within: 1.second,   only: :create, name: "ip-address"
  rate_limit to: 5, within: 30.seconds, only: :create, name: "email",
             by: -> { session_parameters[:email] }

  # Display the session form.
  def new
    @form = SessionForm.new
  end

  # Attempt to create a session from the provided parameters.
  #
  # If successful redirect, otherwise render the session form.
  def create
    @form = SessionForm.new(session_parameters)

    if @form.valid?
      start_new_session_for(@form.account)

      redirect_authenticated_account
    else
      render :new
    end
  end

  # Sign out the current account and redirect to the root.
  def destroy
    terminate_session

    redirect_to root_url
  end

  protected

  # Redirect to the root.
  #
  # @return [void]
  def redirect_authenticated_account
    redirect_to root_url
  end

  # Return the expected parameters from the required session parameter.
  #
  # @return [ActionController::Parameters]
  def session_parameters
    params.expect(session_form: %i(email password))
  end
end
