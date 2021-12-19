# Untitled ![CI](https://github.com/tristandunn/untitled/workflows/CI/badge.svg)

A base Rails application to kickstart new projects.

## Features

* [PostCSS](postcss.config.js) with Tailwind CSS
  [configuration](config/tailwind.config.js).
* JavaScript [tests](spec/javascripts) using
  [Mocha](spec/javascripts/.mocharc.json) with [coverage](nyc.config.js).
* Ruby [tests](spec/) using [RSpec](spec/spec_helper.rb) and
  [Selenium](spec/support/capybara.rb) with
  [coverage](spec/spec_helper.rb#L3-L13).
* Support for [translations](app/assets/javascripts/i18n.js) in JavaScript
  [code](app/assets/javascripts/controllers/stimulus_controller.js) and
  [tests](spec/javascripts/application/controllers/stimulus_controller.spec.js).
* [GitHub Actions](.github/workflows/ci.yml) for testing, linting, and security
  analysis with annotations.

## Development

Install the dependencies and setup the database.

```
bin/setup
```

To run the application processes.

```
foreman start -f Procfile.dev
```

If you're making changes, be sure to write and run the tests.

```
bundle exec rake ruby:test
bundle exec rake javascript:test
```

Before pushing changes, check the code.

```
bundle exec rake css:lint
bundle exec rake ruby:lint
bundle exec rake javascript:lint
```

Or you can run the tests with coverage and lint with a single command.

```
bundle exec rake check
```

## Deployment

### Heroku

Create an application.

```
heroku create
```

Add the Node and Ruby build packs.

```
heroku buildpacks:add heroku/nodejs
heroku buildpacks:add heroku/ruby
```

Add the required Heroku add-ons.

```
heroku addons:create heroku-postgresql:hobby-dev
heroku addons:create heroku-redis:hobby-dev
```

Create production credentials and set the encryption key on Heroku.

```sh
rails credentials:edit --environment production
heroku config:set RAILS_MASTER_KEY=$(cat config/credentials/production.key)
```

Deploy to Heroku.

```
git push heroku main
```

## License

Untitled uses the MIT license. See [LICENSE](LICENSE) for more details.
