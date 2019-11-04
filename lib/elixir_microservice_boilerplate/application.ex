defmodule ElixirMicroserviceBoilerplate.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    :ok =
      :telemetry.attach(
        "appsignal-ecto",
        [:elixir_microservice_boilerplate, :repo, :query],
        &Appsignal.Ecto.handle_event/4,
        nil
      )

    children = [
      ElixirMicroserviceBoilerplate.Repo,
      ElixirMicroserviceBoilerplateWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ElixirMicroserviceBoilerplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ElixirMicroserviceBoilerplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
