# frozen_string_literal: true

Rake::Task["assets:precompile"].clear

namespace :assets do
  desc "Compile all the assets"
  task :precompile do # rubocop:disable Rails/RakeEnvironment
    Rake::Task["webpacker:compile"].invoke
  end
end
