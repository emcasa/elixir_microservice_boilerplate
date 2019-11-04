defmodule MyNewAppWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :my_new_app
  use Sentry.Phoenix.Endpoint
  use Appsignal.Phoenix

  socket "/socket", MyNewAppWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :my_new_app,
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
    key: "_my_new_app_key",
    signing_salt: "v0qo5hfH"

  plug MyNewAppWeb.Router
end
