defmodule BoilerplateWeb.Router do
  use BoilerplateWeb, :router
  use Sentry.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BoilerplateWeb do
    pipe_through :api
  end
end
