FROM ruby:2.7.1
# Add Yarn to the repository
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -     && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# Install system dependencies & clean them up
RUN apt-get update -qq && apt-get install -y \
    postgresql-client build-essential yarn nodejs \
    libnotify-dev && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY package* yarn.lock ./
RUN yarn install
COPY . .
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]