defmodule ElixirMicroserviceBoilerplateWeb.ErrorViewTest do
  use ElixirMicroserviceBoilerplateWeb.ConnCase, async: true

  import Phoenix.View

  test "renders 404.json" do
    assert render(ElixirMicroserviceBoilerplateWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(ElixirMicroserviceBoilerplateWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
