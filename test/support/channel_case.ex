defmodule ElixirMicroserviceBoilerplateWeb.ChannelCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Phoenix.ChannelTest

      @endpoint ElixirMicroserviceBoilerplateWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(ElixirMicroserviceBoilerplate.Repo)

    unless tags[:async] do
      Sandbox.mode(ElixirMicroserviceBoilerplate.Repo, {:shared, self()})
    end

    :ok
  end
end
