# frozen_string_literal: true

require "rails_helper"

describe "Creating a new account" do
  before do
    visit root_path
    click_on t("pages.index.new_account")
  end

  it "successfully" do
    fill_in_account_and_submit(
      email:    generate(:email),
      password: generate(:password)
    )

    expect(page).to have_no_text(t("pages.index.new_account"))
  end

  it "with an invalid e-mail" do
    fill_in_account_and_submit(
      email:    "example@localhost",
      password: generate(:password)
    )

    expect(page).to have_text([
      Account.human_attribute_name(:email).humanize,
      t("errors.messages.invalid")
    ].join(" "))
  end

  it "with an invalid password" do
    fill_in_account_and_submit(
      email:    generate(:email),
      password: "short"
    )

    expect(page).to have_text([
      Account.human_attribute_name(:password).humanize,
      t("errors.messages.too_short", count: Account::MINIMUM_PASSWORD_LENGTH)
    ].join(" "))
  end

  protected

  def fill_in_account_and_submit(email:, password:)
    fill_in t("activemodel.attributes.account_form.email"), with: email
    fill_in t("activemodel.attributes.account_form.password"), with: password
    click_on t("accounts.new.submit")
  end
end
