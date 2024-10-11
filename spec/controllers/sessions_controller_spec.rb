# frozen_string_literal: true

require "rails_helper"

describe SessionsController do
  it { is_expected.to be_a(ApplicationController) }

  describe "#new" do
    context "when signed out" do
      before do
        get :new
      end

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }

      it "assigns a session form" do
        expect(assigns(:form)).to be_a(SessionForm)
      end
    end

    context "when signed in" do
      before do
        sign_in

        get :new
      end

      it { is_expected.to redirect_to(root_url) }
    end
  end

  describe "#create" do
    context "when created successfully" do
      let(:account) { create(:account) }

      before do
        post :create, params: {
          session_form: { email: account.email, password: account.password }
        }
      end

      it { is_expected.to set_session[:account_id].to(account.id) }
      it { is_expected.to redirect_to(root_url) }
    end

    context "when not created successfully" do
      let(:email) { generate(:email) }
      let(:error) { t("sessions.create.error") }

      before do
        post :create, params: {
          session_form: {
            email:    email,
            password: "invalid"
          }
        }
      end

      it { is_expected.to respond_with(200) }
      it { is_expected.to render_template(:new) }
      it { is_expected.not_to set_session[:account_id] }

      it "assigns a session form" do
        expect(assigns(:form)).to be_a(SessionForm)
      end

      it "keeps the provided e-mail" do
        expect(assigns(:form).email).to eq(email)
      end
    end

    context "when signed in" do
      before do
        sign_in

        post :create
      end

      it { is_expected.to redirect_to(root_url) }
    end
  end

  describe "#destroy" do
    let(:account) { create(:account) }

    before do
      sign_in_as account

      delete :destroy
    end

    it { is_expected.to redirect_to(root_url) }

    it "removes the account ID from the session" do
      expect(session[:account_id]).to be_nil
    end
  end
end
