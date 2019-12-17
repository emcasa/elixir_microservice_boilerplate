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
