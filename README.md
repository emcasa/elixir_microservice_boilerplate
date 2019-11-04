# ElixirMicroserviceBoilerplate

This is a boilerplate project to create microservices in elixir

It's pre-configured with some defaults like logging, error-handling and monitoring.

It's intented to be a template rather than for forking.

# Using
  
  - Rename `ElixirMicroserviceBoilerplate` and `elixir_microservice_boilerplate`
  - Check for env vars of services to fill in

# Build

  - `mix deps.get`
  - `mix compile`

# Test

  - `mix test`

# Run

  - `mix ecto.setup`
  - `iex -S mix phx.server`
  - Check [`localhost:4000`](http://localhost:4000)
