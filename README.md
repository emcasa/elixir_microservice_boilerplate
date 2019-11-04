# ElixirMicroserviceBoilerplate

This is a boilerplate project to create microservices in elixir

It's pre-configured with some defaults like logging, error-handling and monitoring.

It's intented to be a template rather than a fork.

# Using
	* Rename `ElixirMicroserviceBoilerplate` and `elixir_microservice_boilerplate`
	* Check for env vars of services to fill in

# Build

	* `mix deps.get`
	* `mix compile`

# Test

	* `mix test`

# Run

	* `mix ecto.setup`
	* `iex -S mix phx.server`

  * Install dependencies: `mix deps.get`
  * Create and migrate database: `mix ecto.setup`
  * Start the server: `mix phx.server`
  * Check [`localhost:4000`](http://localhost:4000)
