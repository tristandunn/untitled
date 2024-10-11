# frozen_string_literal: true

class AccountForm < BaseForm
  attr_accessor :email, :password

  # Attempt to save the account if it's valid.
  #
  # @return [Boolean]
  def save
    if valid?
      account.save
    end
  end

  # Build a new account.
  #
  # @return [Account]
  def account
    @account ||= Account.new(email: email, password: password)
  end

  private

  # Validate the account, merging account errors into the form errors.
  #
  # @return [Boolean]
  def valid?(context = nil)
    account.valid?(context).tap do
      errors.merge!(account.errors)
    end
  end
end
