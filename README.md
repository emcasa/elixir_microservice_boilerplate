# Boilerplate

This is a boilerplate project to create microservices in elixir

It's pre-configured with some defaults like logging, error-handling and monitoring.

It's intented to be a template rather than for forking.

# Using

  - Rename `Boilerplate` and `boilerplate`
  - Check for env vars of services to fill in
  - generate and replace `config/config.exs` `secret_key_base` (e.g.: `:crypto.strong_rand_bytes(64) |> Base.encode64 |> binary_part(0, 64)`)

# Build

  - `mix deps.get`
  - `mix compile`

# Test

  - `mix test`

# Run

  - `mix ecto.setup`
  - `iex -S mix phx.server`
  - Check [`localhost:4001`](http://localhost:4001)

# Docker
  - `docker-compose build`
  - `docker-compose up`