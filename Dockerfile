FROM ruby:2.6

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# installing node.js because Rails needs to have of a JavaScript runtime
RUN apt-get update && apt-get install -y \
    nodejs yarn

WORKDIR /api

COPY . .
RUN gem install bundler
RUN bundle install
RUN yarn

ENV DEBIAN_FRONTEND=dialog

EXPOSE 3000 3000
