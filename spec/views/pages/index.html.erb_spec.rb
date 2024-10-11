# frozen_string_literal: true

require "rails_helper"

describe "pages/index.html.erb" do
  subject(:html) do
    render template: "pages/index", formats: [:html]

    rendered
  end

  before do
    without_partial_double_verification do
      allow(view).to receive(:signed_in?).and_return(false)
    end
  end

  it "renders the header" do
    expect(html).to have_css("h1", text: t("title"))
  end

  it "renders the description" do
    expect(html).to have_css("p", text: t("pages.index.description"))
  end

  it "links to the new account path" do
    expect(html).to have_css(%(a[href="#{new_account_path}"]),
                             text: t("pages.index.new_account"))
  end

  it "links to the new session path" do
    expect(html).to have_css(%(a[href="#{new_sessions_path}"]),
                             text: t("pages.index.sign_in"))
  end

  context "when signed in" do
    before do
      without_partial_double_verification do
        allow(view).to receive(:signed_in?).and_return(true)
      end
    end

    it "renders a sign out button" do
      expect(html).to have_css(
        %(form[action="#{sessions_path}"][method="post"] button[type="submit"])
      )
    end

    it "does not link to the new account path" do
      expect(html).to have_no_css(%(a[href="#{new_account_path}"]),
                                  text: t("pages.index.new_account"))
    end

    it "does not link to the new session path" do
      expect(html).to have_no_css(%(a[href="#{new_sessions_path}"]),
                                  text: t("pages.index.sign_in"))
    end
  end
end
