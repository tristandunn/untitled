# frozen_string_literal: true

require "rails_helper"

describe "Destroying a session" do
  before do
    sign_in

    visit root_path
  end

  it "successfully" do
    sign_out

    expect(page).to have_text(t("pages.index.sign_in"))
  end
end
