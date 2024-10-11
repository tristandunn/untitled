# frozen_string_literal: true

require "rails_helper"

describe Account do
  describe "validations" do
    subject(:account) { build(:account) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value("MrBoB@example.com").for(:email) }
    it { is_expected.not_to allow_value("@.com").for(:email) }

    it { is_expected.to validate_presence_of(:password).allow_blank }

    it "is expected to validate that the length of :email is at most the maximum" do
      expect(account).to validate_length_of(:email)
        .is_at_most(described_class::MAXIMUM_EMAIL_LENGTH)
    end

    it "is expected to validate that the length of :password is at least the minimum" do
      expect(account).to validate_length_of(:password)
        .is_at_least(described_class::MINIMUM_PASSWORD_LENGTH)
    end
  end

  describe "#format_attributes" do
    subject(:account) { create(:account, email: "  AN@EXAMPLE.COM  ") }

    it "downcases and strips e-mail" do
      expect(account.email).to eq("an@example.com")
    end
  end
end
