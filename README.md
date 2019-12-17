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


## Deploy

This project's CircleCI workflow builds a release and then deploys it on beanstalk.

### Configure beanstalk environments

Configure your `.elasticbeanstalk/config.yml` with your application's name and change `EB_ENV` in `.circleci/config.yml` to your prod and staging environment's names.

----

To create a *new* environment use the following command. In case you haven't created an application yet do it first in the aws console.

```
eb create \
  --region us-east-1 \
  --database \
  -db.engine postgres \
  -db.i db.t2.small \
  -db.size 10 \
  --elb-type application \
  --envvars PORT=4000,SECRET_KEY_BASE=some_secret
```

This command creates an rds instance and exposes the credentials on your eb environment. This project is set up to use this database, but you can omit `--database` and `-db` args and configure it manually.

### Configure runtime vars (EB)

All env vars in `config/releases.exs` are read on runtime.
`PORT`, `SECRET_KEY_BASE`, database options and other runtime configs need to be set on the eb environment's "Software" configuration.

#### Database

The database can be configured with `DB_*` vars or by selecting an existing rds instance under Configurations > Database in your eb environment's dashboard.

### Configure build-time vars (CI)

On CircleCI under Settings > Contexts, create contexts for your application's staging and production environments and configure the `build_release_production` and `build_release_staging` workflow steps in `.circleci/config.yml` to use them.

All build time configurations should go in there.
