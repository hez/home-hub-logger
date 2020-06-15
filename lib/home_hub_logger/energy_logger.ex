defmodule HomeHubLogger.EnergyLogger do
  @doc false
  require Logger

  def log_usage([:sensor, :rainforest_eagle, :read], measurements, metadata, _conf) do
    Logger.info(inspect(measurements))
    Logger.info(inspect(metadata))
    res = HomeHubLogger.ReportingConnection.insert(%{power_usage: measurements.usage})
    Logger.info(inspect(res))
    res
  end

  def attach do
    :ok =
      :telemetry.attach(
        "homehub-power-usage-logging",
        [:sensor, :rainforest_eagle, :read],
        &__MODULE__.log_usage/4,
        nil
      )
  end
end
