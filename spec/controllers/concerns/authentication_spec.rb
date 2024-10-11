# frozen_string_literal: true

require "rails_helper"

class AuthenticationTestController < ApplicationController
  include Authentication
  include Rails.application.routes.url_helpers
end

describe Authentication do
  let(:instance) { AuthenticationTestController.new }

  describe ".included" do
    subject(:helper_methods) { AuthenticationTestController._helper_methods }

    it "includes signed_in? method" do
      expect(helper_methods).to include(:signed_in?)
    end

    it "includes signed_out? method" do
      expect(helper_methods).to include(:signed_out?)
    end
  end

  describe "#access_denied" do
    let(:new_sessions_url) { double }

    before do
      allow(instance).to receive(:redirect_to)
      allow(instance).to receive(:new_sessions_url).and_return(new_sessions_url)
    end

    it "redirects to new_sessions_url" do
      instance.send(:access_denied)

      expect(instance).to have_received(:redirect_to).with(new_sessions_url)
    end
  end

  describe "#account_from_session" do
    context "with an account ID in the session" do
      let(:account) { build_stubbed(:account) }
      let(:session) { { account_id: account.id } }

      before do
        allow(instance).to receive(:session).and_return(session)

        allow(Account).to receive(:find_by).and_return(account)
      end

      it "attempts to find the account" do
        instance.account_from_session

        expect(Account).to have_received(:find_by).with(id: session[:account_id])
      end

      it "returns the account" do
        expect(instance.account_from_session).to eq(account)
      end
    end

    context "with no account ID in the session" do
      let(:session)  { {} }

      before do
        allow(instance).to receive(:session).and_return(session)

        allow(Account).to receive(:find_by)
      end

      it "does not attempt to find the account" do
        instance.account_from_session

        expect(Account).not_to have_received(:find_by)
      end

      it "returns nil" do
        expect(instance.account_from_session).to be_nil
      end
    end
  end

  describe "#authenticate" do
    context "when session is resumed" do
      let(:account) { build_stubbed(:account) }

      before do
        allow(instance).to receive(:access_denied)
        allow(instance).to receive(:resume_session).and_return(account)
      end

      it "does not call access_denied" do
        instance.authenticate

        expect(instance).not_to have_received(:access_denied)
      end
    end

    context "when sessign is not resumed" do
      before do
        allow(instance).to receive(:access_denied)
        allow(instance).to receive(:resume_session).and_return(nil)
      end

      it "calls access_denied" do
        instance.authenticate

        expect(instance).to have_received(:access_denied).with(no_args)
      end
    end
  end

  describe "#signed_in?" do
    context "with an account present" do
      let(:account) { build_stubbed(:account) }

      before do
        allow(instance).to receive(:resume_session).and_return(account)
      end

      it "returns true" do
        expect(instance).to be_signed_in
      end
    end

    context "with no account present" do
      before do
        allow(instance).to receive(:resume_session).and_return(nil)
      end

      it "returns false" do
        expect(instance).not_to be_signed_in
      end
    end
  end

  describe "#signed_out?" do
    context "with an account present" do
      let(:account) { build_stubbed(:account) }

      before do
        allow(instance).to receive(:resume_session).and_return(account)
      end

      it "returns false" do
        expect(instance).not_to be_signed_out
      end
    end

    context "with no account present" do
      before do
        allow(instance).to receive(:resume_session).and_return(nil)
      end

      it "returns true" do
        expect(instance).to be_signed_out
      end
    end
  end
end
