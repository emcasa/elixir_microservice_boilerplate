defmodule Boilerplate.DataCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      alias Boilerplate.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Boilerplate.DataCase
    end
  end

  setup tags do
    :ok = Sandbox.checkout(Boilerplate.Repo)

    unless tags[:async] do
      Sandbox.mode(Boilerplate.Repo, {:shared, self()})
    end

    :ok
  end

  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
