import Config

config :boilerplate, Boilerplate.Repo,
  username: System.get_env("POSTGRES_USERNAME") || "postgres",
  password: System.get_env("POSTGRES_PASSWORD") || "postgres",
  database: "boilerplate_dev",
  hostname: System.get_env("POSTGRES_HOSTNAME") || "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :boilerplate, BoilerplateWeb.Endpoint,
  http: [port: 4001],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
