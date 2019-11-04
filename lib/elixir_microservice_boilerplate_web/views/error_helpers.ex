defmodule ElixirMicroserviceBoilerplateWeb.ErrorHelpers do
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(ElixirMicroserviceBoilerplateWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(ElixirMicroserviceBoilerplateWeb.Gettext, "errors", msg, opts)
    end
  end
end
