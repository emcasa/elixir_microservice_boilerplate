defmodule BoilerplateWeb.ConnCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Phoenix.ConnTest
      alias BoilerplateWeb.Router.Helpers, as: Routes

      @endpoint BoilerplateWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(Boilerplate.Repo)

    unless tags[:async] do
      Sandbox.mode(Boilerplate.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
