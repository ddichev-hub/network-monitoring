#!/usr/bin/env bash

set -o errexit
set -o nounset

source configuration.env

echo "==> Prepare Configurations"
sed -e 's/%%INFLUXDB_DB%%/'${DOCKER_INFLUXDB_DB}'/g' \
    -e 's/%%INFLUXDB_ADMIN_USER%%/'${DOCKER_INFLUXDB_ADMIN_USER}'/g' \
    -e 's/%%INFLUXDB_ADMIN_PASSWORD%%/'${DOCKER_INFLUXDB_ADMIN_PASSWORD}'/g' \
    grafana/provisioning/datasources/influxdb.yml.template \
  > grafana/provisioning/datasources/influxdb.yml

echo "==> Docker Image Pull"
docker-compose pull

echo "==> Bring Up Services"
docker-compose up

#Bring up services without active logging
#docker-compose up -d