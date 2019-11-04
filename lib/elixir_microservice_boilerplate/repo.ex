defmodule ElixirMicroserviceBoilerplate.Repo do
  use Ecto.Repo,
    otp_app: :elixir_microservice_boilerplate,
    adapter: Ecto.Adapters.Postgres
end
