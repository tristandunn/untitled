# Untitled ![CI](https://github.com/tristandunn/untitled/workflows/CI/badge.svg)

A base Rails application to kickstart new projects.

## Features

* [Kamal](config/deploy.yml) for deployments.
* [Litestream](config/litestream.yml) database replication for backups.
* [GitHub Actions](.github/workflows/ci.yml) for testing, linting, and security
  analysis with annotations.
* CSS using Tailwind CSS [configuration](config/tailwind.config.js).
* Ruby [tests](spec/) using [RSpec](spec/spec_helper.rb) and
  [Selenium](spec/support/capybara.rb) with
  [coverage](spec/spec_helper.rb#L3-L14).
* JavaScript [tests](spec/javascripts) using
  [Mocha](spec/javascripts/.mocharc.json) with coverage from [c8][].

## Development

Install the dependencies and setup the database.

```
bin/setup
```

To run the application processes.

```
bin/dev
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

### Docker

Build the image with Docker.

```
docker build -t untitled .
```

Run the server using the image.

```
docker run --rm -p 3000:80 -e RAILS_MASTER_KEY=$(cat config/master.key) --name untitled untitled
```

## License

Untitled uses the MIT license. See [LICENSE](LICENSE) for more details.

[c8]: https://www.npmjs.com/package/c8
