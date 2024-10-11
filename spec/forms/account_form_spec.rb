# frozen_string_literal: true

require "rails_helper"

describe AccountForm, type: :form do
  describe "class" do
    it "inherits from the base form" do
      expect(described_class.superclass).to eq(BaseForm)
    end
  end

  describe "#account" do
    subject(:form) { described_class.new(email: generate(:email), password: generate(:password)) }

    it "builds a new account with the form attributes" do
      expect(form.account).to be_a(Account).and(be_new_record).and(
        have_attributes(
          email:    form.email,
          password: form.password
        )
      )
    end
  end

  describe "#save" do
    subject(:form) { described_class.new(email: generate(:email), password: generate(:password)) }

    context "when valid" do
      it "persists the account" do
        form.save

        expect(form.account).to be_persisted
      end
    end

    context "when invalid" do
      before do
        create(:account, email: form.email)
      end

      it "does not persist the account" do
        form.save

        expect(form.account).not_to be_persisted
      end

      it "merges account errors" do
        form.save

        expect(form.errors.messages[:email]).to eq([t("errors.messages.taken")])
      end
    end
  end
end
