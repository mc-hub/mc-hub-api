FROM elixir:alpine

RUN \
      mkdir -p /opt/app && \
      chmod -R 777 /opt/app && \
      apk update && \
      apk --no-cache --update add \
      git make g++ wget curl inotify-tools nodejs yarn imagemagick bash && \
      update-ca-certificates --fresh && \
      rm -rf /var/cache/apk/*

ENV MIX_HOME=/opt/mix \
    HEX_HOME=/opt/hex \
    HOME=/opt/app

# Install Phoenix packages
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new 1.4.8

WORKDIR /opt/app
ADD . /opt/app

EXPOSE 4000
