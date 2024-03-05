FROM ruby:3.2.2

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

CMD rails s -b 0.0.0.0
