#!/usr/bin/env bash

set -o errexit
set -o nounset

source configuration.env

echo "==> Prepare Grafana Configurations"
sed -e 's/%%INFLUXDB_DB%%/'${DOCKER_INFLUXDB_DB}'/g' \
    -e 's/%%INFLUXDB_ADMIN_USER%%/'${DOCKER_INFLUXDB_ADMIN_USER}'/g' \
    -e 's/%%INFLUXDB_ADMIN_PASSWORD%%/'${DOCKER_INFLUXDB_ADMIN_PASSWORD}'/g' \
    grafana/provisioning/datasources/influxdb.yml.template \
  > grafana/provisioning/datasources/influxdb.yml

echo "==> Prepare Telegraf inputs plugins configuration"
sed -e 's/%%TELEGRAF_GNMI_PORT%%/'${DOCKER_TELEGRAF_GNMI_PORT}'/g' \
    -e 's/%%TELEGRAF_GNMI_NODE1%%/'${DOCKER_TELEGRAF_GNMI_NODE1}'/g' \
    -e 's/%%TELEGRAF_GNMI_NODE2%%/'${DOCKER_TELEGRAF_GNMI_NODE2}'/g' \
    -e 's/%%TELEGRAF_GNMI_NODE3%%/'${DOCKER_TELEGRAF_GNMI_NODE3}'/g' \
    -e 's/%%TELEGRAF_GNMI_NODE4%%/'${DOCKER_TELEGRAF_GNMI_NODE4}'/g' \
    -e 's/%%TELEGRAF_GNMI_USERNAME%%/'${DOCKER_TELEGRAF_GNMI_USERNAME}'/g' \
    -e 's/%%TELEGRAF_GNMI_PWD%%/'${DOCKER_TELEGRAF_GNMI_PWD}'/g' \
    telegraf/etc/telegraf.conf.template \
  > telegraf/etc/telegraf.conf

#echo "==> Prepare Grafana dashboards configuration"
#sed -e 's/%%TELEGRAF_GNMI_NODE1%%/'${DOCKER_TELEGRAF_GNMI_NODE1}'/g' \
#    grafana/dashboards/SAOS10xTx_Stats_PortStatus.json.template \
#  > grafana/dashboards/SAOS10xTx_Stats_PortStatus.json

#sed -e 's/%%TELEGRAF_GNMI_NODE1%%/'${DOCKER_TELEGRAF_GNMI_NODE1}'/g' \
#    grafana/dashboards/XCVR-Status.json.template \
#  > grafana/dashboards/XCVR-Status.json


echo "==> Docker Image Pull"
docker-compose pull

echo "==> Bring Up Services"
#docker-compose up

#Bring up services without active logging
docker-compose up -d
