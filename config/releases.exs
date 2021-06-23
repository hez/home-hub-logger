import Config

config :home_hub_logger, HomeHubLogger.ReportingConnection,
  tag_host: "thermostat",
  database: "climate",
  host: System.get_env("INFLUXDB_HOST"),
  pool: [max_overflow: 10, size: 50],
  port: 8086,
  scheme: "http",
  auth: [
    method: :basic,
    username: System.get_env("INFLUXDB_USERNAME"),
    password: System.get_env("INFLUXDB_PASSWORD")
  ],
  writer: Instream.Writer.Line

config :rainforest_eagle, :connection,
  mac_id: System.get_env("RAINFOREST_EAGLE_MACID"),
  host: System.get_env("RAINFOREST_EAGLE_HOST"),
  username: System.get_env("RAINFOREST_EAGLE_USERNAME"),
  password: System.get_env("RAINFOREST_EAGLE_PASSWORD"),
  refresh_interval:
    "RAINFOREST_EAGLE_REFRESH_INTERVAL" |> System.get_env("120") |> String.to_integer()

config :phoscon_api, :connection,
  host: System.get_env("PHOSCON_HOST"),
  api_key: System.get_env("PHOSCON_API_KEY"),
  refresh_interval: 60
