defmodule Boilerplate.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    :ok =
      :telemetry.attach(
        "appsignal-ecto",
        [:boilerplate, :repo, :query],
        &Appsignal.Ecto.handle_event/4,
        nil
      )

    children = [
      Boilerplate.Repo,
      BoilerplateWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Boilerplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    BoilerplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
