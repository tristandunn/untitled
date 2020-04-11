# frozen_string_literal: true

require "rails_helper"

describe "pages/index.html.erb", type: :view do
  subject(:html) do
    render

    rendered
  end

  it "renders the header" do
    expect(html).to have_css("h1", text: t("title"))
  end
end
