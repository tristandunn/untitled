# frozen_string_literal: true

namespace :css do
  desc "Run `yarn build:css`"
  task :build do # rubocop:disable Rails/RakeEnvironment
    system("yarn build:css") ||
      exit($CHILD_STATUS.exitstatus)
  end

  desc "Run `yarn lint:css`"
  task :lint do # rubocop:disable Rails/RakeEnvironment
    system("yarn lint:css") ||
      exit($CHILD_STATUS.exitstatus)
  end
end

if Rake::Task.task_defined?("spec:prepare")
  Rake::Task["spec:prepare"].enhance(["css:build"])
end
