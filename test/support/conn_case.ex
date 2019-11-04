defmodule ElixirMicroserviceBoilerplateWeb.ConnCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Phoenix.ConnTest
      alias ElixirMicroserviceBoilerplateWeb.Router.Helpers, as: Routes

      @endpoint ElixirMicroserviceBoilerplateWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(ElixirMicroserviceBoilerplate.Repo)

    unless tags[:async] do
      Sandbox.mode(ElixirMicroserviceBoilerplate.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
