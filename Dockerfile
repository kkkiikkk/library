# Specify the base image
FROM --platform=linux/amd64 ruby:2.7.3

WORKDIR /app

RUN apt-get update && apt-get install -y nodejs build-essential libffi-dev

RUN gem update --system 3.3.22

RUN gem install bundler -v 2.1.4

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 --retry 5 && gem install ffi --platform=ruby

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
