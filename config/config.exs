# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
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
  url: "http://#{System.get_env("RAINFOREST_EAGLE_HOST")}/cgi-bin/post_manager",
  basic_auth: System.get_env("RAINFOREST_EAGLE_USER_PASS")
