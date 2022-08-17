Gatling Grafana integration with Docker
============================================

A simple showcase of how Gatling Enterprise could be integrated with Grafana.

Pre-requisites: 

* docker & docker-compose
* shell interpreter

How can I use it ?:

* run `./start.sh` on the main directory : it's will start grafana docker and install gatling plugin
* Grafana server will be run on http://localhost:3000/
* set-up [Gatling Datasource](https://gatling.io/docs/enterprise/cloud/reference/plugins/grafana/#adding-the-datasource)
* sample dashboard example in : `gatling-plugin/frontline-grafana/dashboardSamples`
* stop grafana server: `docker compose stop` 
* start grafana server : `docker compose start`