defmodule HomeHubLogger.TemperatureLogger do
  require Logger

  @moduledoc false

  def log_usage([:phoscon, :sensor, :read], measurements, metadata, _conf) do
    Logger.info("Temperatures: #{inspect(measurements)} with #{inspect(metadata)}")
    res = HomeHubLogger.ReportingConnection.insert(measurements, metadata.host)
    Logger.debug("TemperatureLogger insert response: #{inspect(res)}")
    res
  end

  def attach do
    :telemetry.attach(
      "homehub-temperatures",
      [:phoscon, :sensor, :read],
      &__MODULE__.log_usage/4,
      nil
    )
  end
end
