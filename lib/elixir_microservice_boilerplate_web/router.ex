defmodule ElixirMicroserviceBoilerplateWeb.Router do
  use ElixirMicroserviceBoilerplateWeb, :router
  use Sentry.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirMicroserviceBoilerplateWeb do
    pipe_through :api
  end
end
