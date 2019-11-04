use Mix.Config

config :my_new_app, MyNewApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_new_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :my_new_app, MyNewAppWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
