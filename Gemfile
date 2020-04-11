# frozen_string_literal: true

ruby   "2.7.1"
source "https://rubygems.org"

gem "bcrypt",          "3.1.16"
gem "bootsnap",        "1.4.8", require: false
gem "hiredis",         "0.6.3"
gem "i18n-js",         "3.7.1"
gem "jbuilder",        "2.10.1"
gem "oj",              "3.10.14"
gem "pg",              "1.2.3"
gem "puma",            "5.0.0"
gem "rack-timeout",    "0.6.0"
gem "rails",           "6.0.3.3"
gem "redis",           "4.2.2", require: %w(redis redis/connection/hiredis)
gem "sassc-rails",     "2.1.2"
gem "webpacker",       "5.2.1"

group :development, :test do
  gem "cacheflow",    "0.1.1"
  gem "dotenv-rails", "2.7.6"
  gem "rspec-rails",  "4.0.1"
end

group :development do
  gem "brakeman",                "4.9.1",   require: false
  gem "bundler-audit",           "0.7.0.1", require: false
  gem "listen",                  "3.2.1"
  gem "rubocop",                 "0.92.0", require: false
  gem "rubocop-performance",     "1.8.1",  require: false
  gem "rubocop-rails",           "2.8.1",  require: false
  gem "rubocop-rspec",           "1.43.2", require: false
  gem "scss_lint",               "0.59.0", require: false
  gem "simplecov-console",       "0.7.2",  require: false
  gem "spring",                  "2.1.1"
  gem "spring-commands-rspec",   "1.0.4"
  gem "spring-commands-rubocop", "0.2.0"
  gem "web-console",             "4.0.4"
end

group :test do
  gem "capybara",                 "3.33.0"
  gem "database_cleaner",         "1.8.5"
  gem "factory_bot_rails",        "6.1.0"
  gem "faker",                    "2.14.0"
  gem "rails-controller-testing", "1.0.5"
  gem "selenium-webdriver",       "3.142.7"
  gem "shoulda-matchers",         "4.4.1"
end
