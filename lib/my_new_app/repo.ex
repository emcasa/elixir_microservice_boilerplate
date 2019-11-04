defmodule MyNewApp.Repo do
  use Ecto.Repo,
    otp_app: :my_new_app,
    adapter: Ecto.Adapters.Postgres
end
