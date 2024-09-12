# frozen_string_literal: true

namespace :javascript do
  desc "Run `yarn build`"
  task :build do # rubocop:disable Rails/RakeEnvironment
    system("yarn build") ||
      exit($CHILD_STATUS.exitstatus)
  end

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

if Rake::Task.task_defined?("spec:prepare")
  Rake::Task["spec:prepare"].enhance(["javascript:build"])
end
