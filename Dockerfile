FROM bitwalker/alpine-elixir-phoenix:latest

ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

CMD mix ecto.reset && mix phx.server