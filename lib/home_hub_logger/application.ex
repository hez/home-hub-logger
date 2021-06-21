defmodule HomeHubLogger.Application do
  require Logger
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    Logger.info("Starting HomeHubLogger!")

    children = [
      # Start the PubSub system
      HomeHubLogger.ReportingConnection,
      PhosconAPI.Telemetry.child_config(),
      RainforestEagle.Telemetry.child_config()
    ]

    HomeHubLogger.EnergyLogger.attach()
    HomeHubLogger.TemperatureLogger.attach()
    Logger.warn(inspect(Application.get_all_env(:rainforest_eagle)))
    Logger.warn(inspect(Application.get_all_env(:home_hub_logger)))

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HomeHubLogger.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
