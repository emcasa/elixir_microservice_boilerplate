# Boilerplate

This is a boilerplate project to create microservices in elixir

It's pre-configured with some defaults like logging, error-handling and monitoring.

It's intented to be a template rather than for forking.

## Using

  - Rename `Boilerplate` and `boilerplate`
  - Check for env vars of services to fill in
  - generate and replace `config/config.exs` `secret_key_base` (e.g.: `:crypto.strong_rand_bytes(64) |> Base.encode64 |> binary_part(0, 64)`)

## Build

  - `mix deps.get`
  - `mix compile`

## Test

  - `mix test`

## Run

  - `mix ecto.setup`
  - `iex -S mix phx.server`
  - Check [`localhost:4001`](http://localhost:4001)

### Docker

If you prefer working with `docker` it's possible to use `docker-compose` to start all services needed with: `docker-compose up -d`

To check the `status` of all services use the command: `docker-compose ps`.

To start the service, use: `docker-compose exec boilerplate mix phx.server`.
To run tests use: `docker-compose run --rm boilerplate mix test`.
To install new dependencies: `docker-compose run --rm boilerplate mix deps.get`.
To create new migrations: `docker-compose run --rm --workdir="/boilerplate" boilerplate mix ecto.gen.migration {migration_name}`.

If you prefer, mix has some aliases for the common commands:

* `mix compose server`: start the phoenix server in `boilerplate` service
* `mix compose build`: build a new `boilerplate` image.
* `mix compose up`: start all services.
* `mix compose down`: stop all services.
* `mix compose ps`: check `status` for all services.