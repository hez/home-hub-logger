defmodule HomeHubLogger.EnergyLogger do
  require Logger

  @moduledoc false

  def log_usage([:rainforest_eagle, :read], measurements, _metadata, _conf) do
    Logger.info("EnergyLogger: #{inspect(measurements)}")
    res = HomeHubLogger.ReportingConnection.insert(%{power_usage: measurements.usage})
    Logger.debug("EnergyLogger insert response: #{inspect(res)}")
    res
  end

  def attach do
    :telemetry.attach(
      "homehub-power-usage",
      [:rainforest_eagle, :read],
      &__MODULE__.log_usage/4,
      nil
    )
  end
end
