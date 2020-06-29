defmodule HomeHubLogger.MixProject do
  use Mix.Project

  def project do
    [
      app: :home_hub_logger,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {HomeHubLogger.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dev and test
      {:credo, "~> 1.3.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: :dev, runtime: false},
      # Everything else
      {:instream, "~> 0.22"},
      {:phoscon_api, github: "hez/phoscon-api", tag: "v0.1.0"},
      {:rainforest_eagle, github: "hez/rainforest-eagle", tag: "v0.3.0"}
    ]
  end
end
