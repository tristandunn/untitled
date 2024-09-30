# frozen_string_literal: true

namespace :javascript do
  desc "Run `yarn lint`"
  task :lint do # rubocop:disable Rails/RakeEnvironment
    system("yarn lint") ||
      exit($CHILD_STATUS.exitstatus)
  end

  desc "Run `yarn test`"
  task :test do # rubocop:disable Rails/RakeEnvironment
    success = if ENV["COVERAGE"]
                system("yarn test:coverage")
              else
                system("yarn test")
              end

    success || exit($CHILD_STATUS.exitstatus)
  end
end
