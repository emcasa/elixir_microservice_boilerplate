defmodule Boilerplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :boilerplate,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test],
      releases: releases()
    ]
  end

  def application do
    [
      mod: {Boilerplate.Application, []},
      extra_applications: [:lager, :runtime_tools, :sentry, :appsignal, :inets]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.4.10"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:sentry, "~> 7.0"},
      {:lager_humio_backend, "~> 1.2"},
      {:lager, "~>  3.8", override: true},
      {:logger_lager_backend, "~> 0.2"},
      {:appsignal, "~> 1.11"},
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_machina, "~> 2.3", only: :test},
      {:excoveralls, "~> 0.12.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      "git.hook": &git_hook/1,
      compose: &compose/1
    ]
  end

  defp git_hook(_) do
    Mix.shell().cmd("cp priv/git/pre-commit .git/hooks/pre-commit")
    Mix.shell().cmd("chmod +x .git/hooks/pre-commit")
  end

  @compose_commands ~w(up down ps build)

  defp compose(["server"]) do
    Mix.shell().cmd("docker-compose exec boilerplate mix phx.server")
  end

  defp compose([cmd]) when cmd in @compose_commands do
    Mix.shell().cmd("docker-compose #{cmd}")
  end

  defp compose([cmd]) do
    Mix.shell().info("Command #{cmd} not available.")
  end

  defp compose(_) do
    Mix.shell().info(
      "Use one of compose subcommands: server, #{Enum.join(@compose_commands, ", ")}"
    )
  end

  defp releases do
    [
      boilerplate: [
        include_executables_for: [:unix],
        applications: [
          runtime_tools: :permanent,
          lager: :permanent,
          sentry: :permanent,
          appsignal: :permanent,
          inets: :permanent
        ]
      ]
    ]
  end
end
