#!/usr/bin/env bash

docker-compose down
docker system prune --volumes --force
rm grafana/dashboards/XCVR-Status.json
rm grafana/dashboards/SAOS10xTx_Stats_PortStatus.json
rm grafana/provisioning/datasources/influxdb.yml
rm telegraf/etc/telegraf.conf