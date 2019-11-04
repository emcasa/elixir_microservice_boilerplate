defmodule MyNewAppWeb.ConnCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Phoenix.ConnTest
      alias MyNewAppWeb.Router.Helpers, as: Routes

      @endpoint MyNewAppWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(MyNewApp.Repo)

    unless tags[:async] do
      Sandbox.mode(MyNewApp.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
