import Config

config :boilerplate, BoilerplateWeb.Endpoint,
  server: true,
  http: [:inet6, port: String.to_integer(System.fetch_env!("PORT") || "4001")],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

# Database config
config :boilerplate, Boilerplate.Repo,
  hostname: System.fetch_env!("DB_HOST"),
  username: System.fetch_env!("DB_USER"),
  password: System.fetch_env!("DB_PASSWORD"),
  database: System.fetch_env!("DB_INSTANCE"),
  pool_size: 20

config :logger,
  level: :info,
  backends: [:console, LoggerLagerBackend],
  handle_otp_reports: false,
  utc_log: true

config :sentry,
  filter: BoilerplateWeb.SentryEventFilter,
  dsn: System.fetch_env!("SENTRY_DSN")

config :lager,
  log_root: 'tmp',
  handlers: [
    lager_humio_backend: [
      host: 'cloud.humio.com',
      token: System.fetch_env!("HUMIO_INGEST_TOKEN") |> to_charlist(),
      dataspace: 'sandbox',
      source: System.fetch_env!("HUMIO_SOURCE") |> to_charlist(),
      level: :info
    ]
  ]

config :appsignal, :config,
  active: true,
  env: System.fetch_env!("APPSIGNAL_APP_ENV"),
  push_api_key: System.fetch_env!("APPSIGNAL_PUSH_API_KEY")
