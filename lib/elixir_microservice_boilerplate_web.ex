defmodule MyNewAppWeb do
  @moduledoc false
  def controller do
    quote do
      use Phoenix.Controller, namespace: MyNewAppWeb

      import Plug.Conn
      import MyNewAppWeb.Gettext
      alias MyNewAppWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/my_new_app_web/templates",
        namespace: MyNewAppWeb

      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      import MyNewAppWeb.ErrorHelpers
      import MyNewAppWeb.Gettext
      alias MyNewAppWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import MyNewAppWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
