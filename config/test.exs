use Mix.Config

config :boilerplate, Boilerplate.Repo,
  username: "postgres",
  password: "postgres",
  database: "boilerplate_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :boilerplate, BoilerplateWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
