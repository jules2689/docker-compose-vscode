FROM ruby:2.6.3

# Install Dependencies
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler
RUN apt-get update -qq && apt-get install -y nodejs mysql-client

# Set up Workspace
RUN mkdir /app
WORKDIR /app

# Install gems
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 4 --retry 5

# Add Entrypoint
COPY .devcontainer/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Finish setup
COPY . /app
RUN ls /app

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
