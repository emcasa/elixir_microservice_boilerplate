defmodule MyNewApp.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    :ok =
      :telemetry.attach(
        "appsignal-ecto",
        [:my_new_app, :repo, :query],
        &Appsignal.Ecto.handle_event/4,
        nil
      )

    children = [
      MyNewApp.Repo,
      MyNewAppWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: MyNewApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    MyNewAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
