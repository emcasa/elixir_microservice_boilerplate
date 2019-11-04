defmodule ElixirMicroserviceBoilerplate.Application do
  use Application

  def start(_type, _args) do
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
