defmodule ElixirMicroserviceBoilerplateWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :elixir_microservice_boilerplate
  use Sentry.Phoenix.Endpoint
  use Appsignal.Phoenix

  socket "/socket", ElixirMicroserviceBoilerplateWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :elixir_microservice_boilerplate,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_elixir_microservice_boilerplate_key",
    signing_salt: "v0qo5hfH"

  plug ElixirMicroserviceBoilerplateWeb.Router
end
