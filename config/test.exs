use Mix.Config

config :elixir_microservice_boilerplate, ElixirMicroserviceBoilerplate.Repo,
  username: "postgres",
  password: "postgres",
  database: "elixir_microservice_boilerplate_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :elixir_microservice_boilerplate, ElixirMicroserviceBoilerplateWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
