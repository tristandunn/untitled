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
    if email.present?
      @account ||= Account.find_by(email: email)
    end
  end

  protected

  # Determine if the account password matches the session password.
  #
  # @return [Boolean]
  def invalid_password?
    BCrypt::Password.new(account.password_digest) != password
  end

  # Ensure an account was found and the password matches.
  #
  # @return [void]
  def validate_credentials
    if account.nil?
      errors.add(:email, :unknown)
    elsif invalid_password?
      errors.add(:password, :incorrect)
    end
  end
end
