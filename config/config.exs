use Mix.Config

config :elixir_microservice_boilerplate,
  ecto_repos: [ElixirMicroserviceBoilerplate.Repo]

config :elixir_microservice_boilerplate, ElixirMicroserviceBoilerplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SqLQd50vJ16vqvtjAu4NEt7FKXK7igfHcSBMo9766mjAdbHeUmtIsjHksaUjTYDm",
  render_errors: [view: ElixirMicroserviceBoilerplateWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ElixirMicroserviceBoilerplate.PubSub, adapter: Phoenix.PubSub.PG2],
  instrumenters: [Appsignal.Phoenix.Instrumenter]

config :logger, :console,
  backends: [:console],
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :sentry,
  included_environments: ~w(production staging),
  environment_name: System.get_env("ENV") || "development"

config :lager,
  log_root: 'tmp',
  handlers: [
    lager_console_backend: [
      level: :debug
    ]
  ]

config :appsignal, :config,
  active: false,
  name: "elixir_microservice_boilerplate",
  env: Mix.env()

import_config "#{Mix.env()}.exs"
