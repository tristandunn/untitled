# frozen_string_literal: true

module RSpec
  module Helpers
    module Session
      module Controller
        def sign_in
          sign_in_as create(:account)
        end

        def sign_in_as(account)
          session[:account_id] = account.id
        end
      end

      module Feature
        def sign_in
          sign_in_as create(:account)
        end

        def sign_in_as(account)
          visit root_path(account: account.id)
        end

        def sign_out
          click_on t("pages.index.sign_out")
        end
      end

      RSpec.configure do |config|
        config.include Controller, type: :controller
        config.include Feature,    type: :feature
      end
    end
  end
end
