# frozen_string_literal: true

require "rails_helper"

describe SessionForm, type: :form do
  describe "class" do
    it "inherits from the base form" do
      expect(described_class.superclass).to eq(BaseForm)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_presence_of(:password) }
  end

  describe "#initialize" do
    subject(:form) { described_class.new(email: email, password: password) }

    let(:email)    { generate(:email) }
    let(:password) { generate(:password) }

    it "assigns the e-mail" do
      expect(form.email).to eq(email)
    end

    it "assigns the password" do
      expect(form.password).to eq(password)
    end
  end

  describe "#account" do
    subject(:form) { described_class.new(email: email) }

    let(:account) { create(:account) }

    context "with a matching account" do
      let(:email) { account.email }

      it "returns the account" do
        expect(form.account).to eq(account)
      end
    end

    context "with an unknown account" do
      let(:email) { generate(:email) }

      it "returns nil" do
        expect(form.account).to be_nil
      end
    end

    context "with a blank e-mail" do
      let(:email) { "" }

      before do
        allow(Account).to receive(:find_by)
      end

      it "does not attempt to find the account" do
        form.account

        expect(Account).not_to have_received(:find_by)
      end

      it "returns nil" do
        expect(form.account).to be_nil
      end
    end

    context "with an oddly formatted e-mail" do
      let(:email) { "  #{account.email.upcase}  " }

      it "returns the account" do
        expect(form.account).to eq(account)
      end
    end
  end

  describe "#persisted?" do
    subject(:form) { described_class.new }

    it "returns false" do
      expect(form.persisted?).to be(false)
    end
  end

  describe "#validate_account_and_password" do
    subject(:form) { described_class.new(email: email, password: password) }

    let(:account) { create(:account) }

    before do
      form.valid?
    end

    context "with a valid account and password" do
      let(:email)    { account.email }
      let(:password) { account.password }

      it "is valid" do
        expect(form).to be_valid
      end

      it "does not add errors" do
        expect(form.errors).to be_empty
      end
    end

    context "without an account" do
      let(:email)    { "fake@example.com" }
      let(:password) { generate(:password) }

      it "is not valid" do
        expect(form).not_to be_valid
      end

      it "adds an error message for e-mail" do
        expect(form.errors[:email]).to eq(
          [t("activemodel.errors.models.session_form.attributes.email.unknown")]
        )
      end
    end

    context "with an invalid password" do
      let(:email)    { account.email }
      let(:password) { "wrong" }

      it "is not valid" do
        expect(form).not_to be_valid
      end

      it "adds an error message for password" do
        expect(form.errors[:password]).to eq(
          [t("activemodel.errors.models.session_form.attributes.password.incorrect")]
        )
      end
    end
  end
end
