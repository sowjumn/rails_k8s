FROM ruby:2.7.1

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container


RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN gem install bundler -v 2.4.19

COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

