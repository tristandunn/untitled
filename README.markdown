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
* Support for [translations](app/javascript/i18n.js) in JavaScript
  [code](app/javascript/controllers/stimulus_controller.js) and
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

## License

Untitled uses the MIT license. See [LICENSE](LICENSE) for more details.
