# frozen_string_literal: true

begin
  require "bundler/audit"

  namespace :bundle do
    desc "Updates the Ruby advisory database and runs bundle audit"
    task :audit do # rubocop:disable Rails/RakeEnvironment
      system "bundle audit -q -u"
    end
  end
rescue LoadError # rubocop:disable Lint/SuppressedException
end
