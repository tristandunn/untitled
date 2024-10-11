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
    subject(:form) { described_class.new(email: email, password: password) }

    let(:account) { create(:account, password: password) }

    context "with a valid account and password" do
      let(:email)    { account.email }
      let(:password) { generate(:password) }

      it "returns the account" do
        expect(form.account).to eq(account)
      end
    end

    context "with an unknown account" do
      let(:email)    { generate(:email) }
      let(:password) { generate(:password) }

      it "returns nil" do
        expect(form.account).to be_nil
      end
    end

    context "with a blank e-mail" do
      let(:email)    { "" }
      let(:password) { generate(:password) }

      before do
        allow(Account).to receive(:find_by)
      end

      it "returns nil" do
        expect(form.account).to be_nil
      end
    end

    context "with an oddly formatted e-mail" do
      let(:email)    { "  #{account.email.upcase}  " }
      let(:password) { generate(:password) }

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

  describe "#valid?" do
    subject(:valid?) { form.valid? }

    let(:form) { described_class.new(email: generate(:email), password: generate(:password)) }

    context "with an account" do
      let(:account) { create(:account) }

      before do
        allow(form).to receive(:account).and_return(account)
      end

      it "is valid" do
        expect(valid?).to be(true)
      end

      it "does not add errors" do
        valid?

        expect(form.errors).to be_empty
      end
    end

    context "without an account" do
      before do
        allow(form).to receive(:account).and_return(nil)
      end

      it "is not valid" do
        expect(valid?).to be(false)
      end

      it "adds an error message for e-mail" do
        valid?

        expect(form.errors[:email]).to eq(
          [t("activemodel.errors.models.session_form.attributes.email.unknown")]
        )
      end
    end
  end
end
