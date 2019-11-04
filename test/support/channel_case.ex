defmodule ElixirMicroserviceBoilerplateWeb.ChannelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Phoenix.ChannelTest

      @endpoint ElixirMicroserviceBoilerplateWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElixirMicroserviceBoilerplate.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ElixirMicroserviceBoilerplate.Repo, {:shared, self()})
    end

    :ok
  end
end
