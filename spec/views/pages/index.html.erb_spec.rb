# frozen_string_literal: true

require "rails_helper"

describe "pages/index.html.erb" do
  subject(:html) do
    render template: "pages/index", formats: [:html]

    rendered
  end

  it "renders the header" do
    expect(html).to have_css("h1", text: t("title"))
  end

  it "renders the description" do
    expect(html).to have_css("p", text: t("pages.index.description"))
  end

  it "renders the new account link" do
    expect(html).to have_link(t("pages.index.new_account"), href: "#")
  end
end
