#!/usr/bin/env bash

docker-compose down
docker system prune --volumes --force
docker rmi `sudo docker image ls | egrep telegraf\|grafana\|influxdb | awk '{print$3}'`
docker volume rm `sudo docker volume ls | egrep network-monitoring | awk '{print$2}'`
#rm grafana/dashboards/XCVR-Status.json
#rm grafana/dashboards/SAOS10xTx_Stats_PortStatus.json
rm grafana/provisioning/datasources/influxdb.yml
rm telegraf/etc/telegraf.conf
