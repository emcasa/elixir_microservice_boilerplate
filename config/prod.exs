import Config

config :boilerplate, BoilerplateWeb.Endpoint,
  url: [host: System.get_env("HOST") || "example.com", port: 80]

config :logger,
  level: :info,
  backends: [:console, LoggerLagerBackend],
  handle_otp_reports: false,
  utc_log: true

config :sentry,
  filter: BoilerplateWeb.SentryEventFilter,
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

config :logger,
  level: :info,
  backends: [:console, LoggerLagerBackend],
  handle_otp_reports: false,
  utc_log: true

config :sentry,
  filter: BoilerplateWeb.SentryEventFilter,
  dsn: System.get_env("SENTRY_DSN")

config :appsignal, :config,
  active: true,
  env: System.get_env("APPSIGNAL_APP_ENV"),
  push_api_key: System.get_env("APPSIGNAL_PUSH_API_KEY")
