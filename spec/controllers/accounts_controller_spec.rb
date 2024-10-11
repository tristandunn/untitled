# frozen_string_literal: true

require "rails_helper"

describe AccountsController do
  it { is_expected.to be_a(ApplicationController) }

  describe "#new" do
    context "when signed out" do
      before do
        get :new
      end

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }

      it "assigns a form" do
        expect(assigns(:form)).to be_a(AccountForm)
      end
    end

    context "when signed in" do
      let(:account) { create(:account) }

      before do
        sign_in_as account

        get :new
      end

      it { is_expected.to redirect_to(root_url) }
    end
  end

  describe "#create" do
    context "when created successfully" do
      let(:account) { form.account }
      let(:form)    { assigns(:form) }

      before do
        post :create, params: {
          account_form: {
            email:    generate(:email),
            password: generate(:password)
          }
        }
      end

      it { is_expected.to set_session[:account_id].to(account.id) }
      it { is_expected.to redirect_to(root_url) }

      it "creates an account" do
        expect(account).to be_an(Account).and(be_persisted)
      end
    end

    context "when not created successfully" do
      let(:account) { form.account }
      let(:form)    { assigns(:form) }

      before do
        post :create, params: { account_form: { email: "", password: "" } }
      end

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
      it { is_expected.not_to set_session[:account_id] }

      it "assigns the account" do
        expect(account).to be_an(Account)
      end

      it "does not create an account" do
        expect(account).not_to be_persisted
      end
    end

    context "when signed in" do
      let(:account) { create(:account) }

      before do
        sign_in_as account

        post :create, params: { account_form: { email: "" } }
      end

      it { is_expected.to redirect_to(root_url) }
    end
  end
end
