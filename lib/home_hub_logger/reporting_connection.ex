defmodule HomeHubLogger.ReportingConnection do
  @doc false
  use Instream.Connection, otp_app: :home_hub_logger

  def insert(%{power_usage: reading}) do
    IO.inspect(reading, label: ReportingConnection)
    data_point = %{tags: %{host: host()}, measurement: "power_usage", fields: %{value: reading}}
    write(%{points: [data_point], database: "climate"})
  end

  def host do
    :home_hub_logger
    |> Application.get_env(HomeHubLogger.ReportingConnection)
    |> Keyword.get(:tag_host, :home_hub_logger)
  end
end
