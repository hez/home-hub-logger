# HomeHubLogger

Logs various sensors back to a central influxdb.

Currently logs:
- [Rainforest Eagle](https://github.com/hez/rainforest-eagle)

TODO:
- Various homebridge sensors
- Outdoor weather sensor

## Installation

This could be run as a stand alone app, but we deploy it using Docker.

Example

docker-compose.yaml example config
```
services:
  hublogger:
    build:
      context: ./home_hub_logger
    volumes:
      - ./home_hub_logger:/app
    network_mode: host
    restart: always
    environment:
      - MIX_ENV=prod
      - RAINFOREST_EAGLE_HOST=http://<host>
      - RAINFOREST_EAGLE_MACID=<mac id>
      - RAINFOREST_EAGLE_USERNAME=<username>
      - RAINFOREST_EAGLE_PASSWORD=<password>
      - INFLUXDB_HOST=<host>
      - INFLUXDB_USERNAME=<username>
      - INFLUXDB_PASSWORD=<password>
```
