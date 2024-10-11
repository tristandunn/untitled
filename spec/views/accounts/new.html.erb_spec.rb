# frozen_string_literal: true

require "rails_helper"

describe "accounts/new.html.erb" do
  subject(:html) do
    render template: "accounts/new"

    rendered
  end

  let(:form) { AccountForm.new }

  before do
    assign :form, form
  end

  it "renders the header" do
    expect(html).to have_css("h1", text: t("accounts.new.header"))
  end

  it "renders a form to create an account" do
    expect(html).to have_css(
      %(form.highlight-errors[action="#{accounts_path}"][method="post"])
    )
  end

  it "renders an e-mail field" do
    expect(html).to have_css(
      %(input#account_form_email[autocomplete="email"][autofocus][required])
    )
  end

  it "renders a password field" do
    expect(html).to have_css(%(input#account_form_password[required]))
  end

  it "renders a submit button" do
    expect(html).to have_button(t("accounts.new.submit"))
  end

  context "when errors are present" do
    before do
      form.errors.add(:email, :invalid)
      form.errors.add(:password, :invalid)
    end

    it "wraps e-mail field in error container" do
      expect(html).to have_css(".field_with_errors #account_form_email")
    end

    it "displays e-mail error message" do
      expect(html).to have_css("p", text: [
        AccountForm.human_attribute_name(:email).humanize,
        t("errors.messages.invalid")
      ].join(" "))
    end

    it "wraps password field in error container" do
      expect(html).to have_css(".field_with_errors #account_form_password")
    end

    it "displays password error message" do
      expect(html).to have_css("p", text: [
        AccountForm.human_attribute_name(:password).humanize,
        t("errors.messages.invalid")
      ].join(" "))
    end
  end
end
