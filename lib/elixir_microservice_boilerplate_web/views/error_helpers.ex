defmodule MyNewAppWeb.ErrorHelpers do
  @moduledoc false
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(MyNewAppWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(MyNewAppWeb.Gettext, "errors", msg, opts)
    end
  end
end
