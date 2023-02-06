ARG RUBY_VERSION="3.2.2"

FROM ruby:$RUBY_VERSION-alpine3.18 AS builder

# Accept optional arguments.
ARG BUNDLE_WITHOUT="development test"
ARG ENVIRONMENT="production"
ARG NODE_VERSION="18.17.0"

# Set environment variables.
ENV BUNDLE_WITHOUT=${BUNDLE_WITHOUT} \
  NODE_ENV=${ENVIRONMENT} \
  RAILS_ENV=${ENVIRONMENT} \
  REMOVE_JS_BUILD_YARN_INSTALL=true

# Install build dependency requirements.
RUN apk -U upgrade \
  && apk add --no-cache build-base libpq-dev libxml2-dev libxslt-dev tzdata \
  && apk add --no-cache \
             --repository https://dl-cdn.alpinelinux.org/alpine/edge/main/ \
             nodejs=${NODE_VERSION}-r0 yarn

# Change to a build working directory.
WORKDIR /build

# Copy the package into Docker.
COPY .yarnrc.yml package.json yarn.lock .
COPY .yarn .yarn

# Install the Node.js dependencies.
RUN yarn install

# Configure Bundler.
RUN bundle config --local build.nokogiri --use-system-libraries \
  && bundle config --local without "${BUNDLE_WITHOUT}"

# Copy the Gemfile into Docker.
COPY Gemfile Gemfile.lock .

# Install the Bundler version specified.
RUN gem install bundler -v $(tail -n1 Gemfile.lock)

# Install the Ruby dependencies.
RUN bundle install

# Copy in folders fore Bootsnap precompilation.
COPY app app
COPY lib lib

# Precompile the Bootsnap cache.
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Copy in files for assets precompilation.
COPY app/assets app/assets
COPY app/javascript app/javascript
COPY bin bin
COPY config config
COPY Rakefile Rakefile

# Compile the static assets.
RUN mv config/credentials.yml.enc.sample config/credentials.yml.enc \
  && mv config/master.key.sample config/master.key \
  && bundle exec rails assets:precompile \
  && rm config/credentials.yml.enc \
  && rm config/master.key;

FROM ruby:$RUBY_VERSION-alpine3.18 AS application

ENV NODE_ENV=${ENVIRONMENT} \
  RAILS_ENV=${ENVIRONMENT}

RUN apk -U upgrade \
  && apk add --no-cache libpq-dev tzdata

# Create a application-specific user.
RUN addgroup -S runner \
  && adduser -S runner -G runner

# Switch to the user.
USER runner

# Create the application directory.
RUN mkdir -p /home/runner/app
WORKDIR /home/runner/app

# Copy the application into Docker.
COPY --chown=runner . .

# Copy in the assets, cache, and dependencies.
COPY --chown=runner --from=builder /build/app/assets/builds app/assets/builds
COPY --chown=runner --from=builder /build/public/assets public/assets
COPY --chown=runner --from=builder /build/tmp/cache/bootsnap tmp/cache/bootsnap
COPY --chown=runner --from=builder /usr/local/bundle /usr/local/bundle

# Expose the server.
EXPOSE 3000

# Run the server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
