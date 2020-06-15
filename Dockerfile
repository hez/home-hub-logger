FROM elixir:1.10.3

RUN mix deps.get && mix compile

CMD mix --no-halt
