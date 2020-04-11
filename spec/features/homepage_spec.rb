# frozen_string_literal: true

require "rails_helper"

describe "Homepage", type: :feature do
  before do
    visit "/"
  end

  it "renders the header" do
    expect(page).to have_content(I18n.t("title"))
  end

  it "renders the React application", js: true do
    expect(page).to have_content(I18n.t("description"))
  end
end
