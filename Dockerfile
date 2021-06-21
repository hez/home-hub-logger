FROM elixir:1.12.1

ENV MIX_ENV prod
COPY . /app
WORKDIR /app
RUN ls -la
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get && mix compile

CMD mix deps.get && mix run --no-halt
