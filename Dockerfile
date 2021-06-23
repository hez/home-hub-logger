FROM elixir:1.12.1-alpine as build

# install build dependencies
RUN apk add --no-cache git build-base

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build project
COPY lib lib
RUN mix compile

# build release (uncomment COPY if rel/ exists)
# COPY rel rel
RUN mix release

# prepare release image
FROM alpine:3.14 AS app
RUN apk add --no-cache bash openssl libgcc libstdc++ ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/home_hub_logger ./

ENV HOME=/app

CMD ["bin/home_hub_logger", "start"]
