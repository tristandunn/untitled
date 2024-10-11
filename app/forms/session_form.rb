# frozen_string_literal: true

class SessionForm < BaseForm
  attr_accessor :email, :password

  validates :email,    presence: true
  validates :password, presence: true

  validate :validate_credentials

  # Attempt to find the session account by e-mail.
  #
  # @return [Account]
  def account
    @account ||= Account.authenticate_by(email: email, password: password)
  end

  protected

  # Ensure an account was found and the password matches.
  #
  # @return [void]
  def validate_credentials
    if account.nil?
      errors.add(:email, :unknown)
    end
  end
end
