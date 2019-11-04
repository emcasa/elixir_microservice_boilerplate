defmodule BoilerplateWeb.ErrorHelpers do
  @moduledoc false
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(BoilerplateWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(BoilerplateWeb.Gettext, "errors", msg, opts)
    end
  end
end
