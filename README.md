# HomeHubLogger

Logs various sensors back to a central influxdb.

Currently logs:
- [Rainforest Eagle](https://github.com/hez/rainforest-eagle)
- [ZigBee Sensors](https://github.com/hez/phoscon-api)

TODO:
- Various homebridge sensors
- Outdoor weather sensor

## Installation

This could be run as a stand alone app, but we deploy it using Docker. See
the [docker-compose](docker-compose.yml) config for an example.

### Phoscon Authentication

`curl -d "{\"devicetype\": \"hublogger\"}" <deconz/phoscon host>/api`

Take the returned "username" and subsitute it in your docker-compose config
