defmodule MyNewAppWeb.ChannelCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Phoenix.ChannelTest

      @endpoint MyNewAppWeb.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(MyNewApp.Repo)

    unless tags[:async] do
      Sandbox.mode(MyNewApp.Repo, {:shared, self()})
    end

    :ok
  end
end
