# frozen_string_literal: true

require "capybara"

Capybara.server = :puma, { Silent: true }
Capybara.javascript_driver = :selenium_chrome_headless

# Ignore deprecation warning.
Selenium::WebDriver.logger.ignore(:browser_options)
