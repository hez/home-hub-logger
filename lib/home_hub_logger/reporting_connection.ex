defmodule HomeHubLogger.ReportingConnection do
  @moduledoc false
  use Instream.Connection, otp_app: :home_hub_logger
  require Logger

  def insert(%{power_usage: reading}) do
    data_point = %{tags: %{host: host()}, measurement: "power_usage", fields: %{value: reading}}
    write(%{points: [data_point], database: "climate"})
  end

  def insert(%{temperature: temp}, host) do
    temp_data = %{tags: %{host: host}, measurement: "temperature", fields: %{value: temp}}
    write(%{points: [temp_data], database: "climate"})
  end

  def insert(%{humidity: hum}, host) do
    humid_data = %{tags: %{host: host}, measurement: "humidity", fields: %{value: hum}}
    write(%{points: [humid_data], database: "climate"})
  end

  def insert(v, _k), do: Logger.warn("unhandled reporting insert #{inspect(v)}")

  def host do
    :home_hub_logger
    |> Application.get_env(HomeHubLogger.ReportingConnection)
    |> Keyword.get(:tag_host, :home_hub_logger)
  end
end
