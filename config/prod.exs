use Mix.Config

config :elixir_microservice_boilerplate, ElixirMicroserviceBoilerplateWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger,
	level: :info,
  backends: [:console, LoggerLagerBackend],
  handle_otp_reports: false,
  utc_log: true

config :sentry,
  filter: ElixirMicroserviceBoilerplateWeb.SentryEventFilter,
  dsn: System.get_env("SENTRY_DSN")

config :lager,
  log_root: 'tmp',
  handlers: [
    lager_humio_backend: [
      host: 'cloud.humio.com',
      token: System.get_env("HUMIO_INGEST_TOKEN") |> to_charlist(),
      dataspace: 'sandbox',
      source: System.get_env("HUMIO_SOURCE") |> to_charlist(),
      level: :info
    ]
  ]

import_config "prod.secret.exs"
