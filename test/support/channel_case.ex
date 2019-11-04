defmodule BoilerplateWeb.ChannelCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Phoenix.ChannelTest

      @endpoint BoilerplateWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(Boilerplate.Repo)

    unless tags[:async] do
      Sandbox.mode(Boilerplate.Repo, {:shared, self()})
    end

    :ok
  end
end
