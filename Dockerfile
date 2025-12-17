# Accept optional arguments.
ARG RUBY_VERSION="3.4.8-alpine3.23"

# Create a base image.
FROM ruby:$RUBY_VERSION AS base

# Set production environment variables.
ENV BUNDLE_DEPLOYMENT="1" \
  BUNDLE_PATH="/usr/local/bundle" \
  BUNDLE_WITHOUT="development test" \
  RAILS_ENV="production" \
  RUBY_YJIT_ENABLE="true"

# Change to an application working directory.
WORKDIR /rails

# Install dependency requirements.
RUN apk -U upgrade \
  && apk add --no-cache bash gcompat jemalloc libxml2-dev libxslt-dev sqlite tzdata yaml-dev

# Create a builder image for Ruby.
FROM base AS build

# Install build dependency requirements.
RUN apk add --no-cache build-base

# Copy in files for Bundler.
COPY Gemfile Gemfile.lock ./

# Install the Bundler version specified.
RUN gem install bundler -v $(tail -n1 Gemfile.lock)

# Install the Ruby dependencies.
RUN bundle install

# Clean up dependency caches.
RUN rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Precompile the Bootsnap cache for the dependencies.
RUN bundle exec bootsnap precompile --gemfile --jobs 0

# Copy the application into Docker.
COPY . .

# Precompile the Bootsnap cache for the application.
RUN bundle exec bootsnap precompile  --jobs 0 app/ lib/

# Compile the assets without requiring the secret RAILS_MASTER_KEY.
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# Create an image for the application.
FROM base AS application

# Copy the application and dependencies into Docker.
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Set a custom entrypoint.
ENTRYPOINT ["bin/docker-entrypoint"]

# Expose the server.
EXPOSE 80

# Run the server via Thruster.
CMD ["bin/thrust", "bin/rails", "server"]
