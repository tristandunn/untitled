# frozen_string_literal: true

require "rails_helper"

describe "Homepage" do
  before do
    visit "/"
  end

  it "renders the header" do
    expect(page).to have_content(I18n.t("title"))
  end

  it "renders the description" do
    expect(page).to have_content(I18n.t("pages.index.description"))
  end

  it "renders the Turbo and Stimulus description", :js do
    expect(page).to have_content(I18n.t("pages.stimulus.description"))
  end
end
