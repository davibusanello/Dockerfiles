FROM ruby:2.4-alpine

MAINTAINER Davi Busanello <itsme@davibusanello.net>
LABEL maintainer "Davi Busanello <itsme@davibusanello.net>"
#Image name alpine-rails-talk-min
#
#Get container ip
#docker run --rm -ti -v $(pwd):/usr/src/app --user "$(id -u):$(id -g)" 
#docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(docker ps -q)
#alias server='rails s -b 0.0.0.0'
#rails s -b 0.0.0.0 >> /dev/null &

# Use en_US.UTF-8 as our locale
ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8
ENV RAILS_ENV development

ENV INSTALL_PATH /usr/src
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
ENV HOME=/usr/src PATH=/usr/src/bin:$PATH

RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache curl && \
    apk add --no-cache build-base && \
    apk add --no-cache nodejs && \
    apk add --no-cache sqlite-dev && \
    apk add --no-cache tzdata libxml2-dev libxslt-dev && \
    apk add --no-cache  ruby-dev vim ruby-io-console ruby-json yaml
    # apk add --no-cache ruby-bundler ruby-io-console


#RUN adduser -ms /bin/ash rails

#USER rails

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_BIN="$GEM_HOME/bin" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH
RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
	&& chmod 777 "$GEM_HOME" "$BUNDLE_BIN"
RUN gem install --no-document rails
#Rails dependences
RUN gem install --no-document rake minitest tzinfo tzinfo-data turbolinks jbuilder spring spring-watcher-listen coffee-rails jquery-rails web-console sass-rails
RUN gem install --no-document byebug --version 9.0.6 && \
	gem install --no-document sqlite3 --version 1.3.13 && \
	gem install --no-document listen --version 3.0.8 && \
	gem install --no-document puma --version 3.8.2 && \
	gem install --no-document uglifier --version 3.1.12

EXPOSE 3000:3000

# RUN rails new teste
# RUN cd teste && \
# 	echo "gem 'tzinfo'" >> Gemfile && \
# 	echo "gem 'tzinfo-data'" >> Gemfile

ENTRYPOINT ["ash"]
