defmodule BoilerplateWeb do
  @moduledoc false
  def controller do
    quote do
      use Phoenix.Controller, namespace: BoilerplateWeb

      import Plug.Conn
      import BoilerplateWeb.Gettext
      alias BoilerplateWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/boilerplate_web/templates",
        namespace: BoilerplateWeb

      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      import BoilerplateWeb.ErrorHelpers
      import BoilerplateWeb.Gettext
      alias BoilerplateWeb.Router.Helpers, as: Routes
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
      import BoilerplateWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
