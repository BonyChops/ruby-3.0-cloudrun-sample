# Use the official lightweight Ruby image.
# https://hub.docker.com/_/ruby
FROM ruby:3.1-slim

# Install production dependencies.
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
ENV BUNDLE_FROZEN=true
RUN gem install bundler
RUN bundle config set without 'test'
RUN bundle install

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD ["ruby", "./app.rb"]
