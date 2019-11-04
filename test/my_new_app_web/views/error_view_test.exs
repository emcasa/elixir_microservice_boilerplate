defmodule MyNewAppWeb.ErrorViewTest do
  use MyNewAppWeb.ConnCase, async: true

  import Phoenix.View

  test "renders 404.json" do
    assert render(MyNewAppWeb.ErrorView, "404.json", []) == %{
             errors: %{detail: "Not Found"}
           }
  end

  test "renders 500.json" do
    assert render(MyNewAppWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
