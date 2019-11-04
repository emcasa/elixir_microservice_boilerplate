defmodule MyNewAppWeb.Router do
  use MyNewAppWeb, :router
  use Sentry.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyNewAppWeb do
    pipe_through :api
  end
end
