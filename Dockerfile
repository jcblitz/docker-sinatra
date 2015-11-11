FROM ubuntu:latest

MAINTAINER jcblitz "https://github.com/jcblitz"

RUN apt-get update
RUN apt-get install -q -y --force-yes build-essential wget git
RUN apt-get install -q -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

# Install system ruby
RUN wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
RUN tar -xzvf ruby-2.2.3.tar.gz
RUN cd ruby-2.2.3/ && ./configure && make && make install

RUN gem update --system
RUN gem install bundler

ADD . /app
WORKDIR /app

RUN bundle install

# default sinatra port
EXPOSE 4567

CMD ["/usr/local/bin/foreman","start","-d","/app"]
