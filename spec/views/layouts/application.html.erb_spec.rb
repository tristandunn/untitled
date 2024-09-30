# frozen_string_literal: true

require "rails_helper"

describe "layouts/application.html.erb" do
  subject(:html) do
    render template: "layouts/application", formats: [:html]

    rendered
  end

  it "renders the page title" do
    expect(html).to have_title(t("title"))
  end
end
