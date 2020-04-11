# Untitled ![CI](https://github.com/tristandunn/untitled/workflows/CI/badge.svg)

A base Rails application to kickstart new projects.

## Features

* Ruby [tests](spec/) using [RSpec](spec/spec_helper.rb) and [Selenium](spec/support/capybara.rb) with [coverage](spec/spec_helper.rb#L3-L13).
* JavaScript [tests](spec/javascripts) using [Mocha](spec/javascripts/.mocharc.json) with [coverage](nyc.config.js).
* [PostCSS](postcss.config.js) with Tailwind CSS [configuration](app/assets/javascripts/tailwind.config.js).
* Support for [translations](app/assets/javascripts/i18n.js) in JavaScript [code](app/assets/javascripts/application.jsx) and [tests](spec/javascripts/application/index.spec.js).
* GitHub Workflow [configuration](.github/workflows/ci.yml) for continuous integration and security analysis.

## Development

Install the dependencies and setup the database.

    bin/setup

To run the application processes.

    foreman start -f Procfile.dev

If you're making changes, be sure to write and run the tests.

    bundle exec rake ruby:test
    bundle exec rake javascript:test

Before pushing changes, check the code.

    bundle exec rake css:lint
    bundle exec rake ruby:lint
    bundle exec rake javascript:lint

Or you can run the tests with coverage and lint with a single command.

    bundle exec rake check

## Deployment

### Heroku

Create an application.

    heroku create

Add the Node and Ruby buildpacks.

    heroku buildpacks:add heroku/nodejs
    heroku buildpacks:add heroku/ruby

Create production credentials and set the encryption key on Heroku.

    rails credentials:edit --environment production
    heroku config:set RAILS_MASTER_KEY=$(cat config/credentials/production.key)

Deploy to Heroku.

    git push heroku master
