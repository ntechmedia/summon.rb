FROM --platform=$BUILDPLATFORM ruby:2.7.8
ENV APP_HOME /app
RUN apt-get update -qq && apt-get install -y build-essential

# Install development tools
RUN apt-get -y install vim

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN gem install ruby-debug-ide --pre
RUN gem install bundler -v 2.3.14
RUN bundle install
