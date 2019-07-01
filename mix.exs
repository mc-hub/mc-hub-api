defmodule Mchub.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:ex_machina, "~> 2.3", only: :test},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:scribe, "~> 0.8", only: [:dev, :test]},
      {:ex_spec, "~> 2.0", only: :test},
      {:faker, "~> 0.12", only: :test},

      {:guardian, "~> 1.0"},
      {:elixir_uuid, "~> 1.2"},
      {:tesla, "~> 1.2.0"},
      {:hackney, "~> 1.14.0"}, 
      {:jason, ">= 1.0.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run apps/database/priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
