# network-monitoring

Testing monitoring devices via GRPC with Telegraf, InfluxDB and Grafana

The example has dummy IPs and doesn't include client certificates. 

1. Obtain CA cer, client cert and key and place them in telegraf/etc
    - make sure to change the name in telegraf.conf file. Look for client.cert.pem, client.key.pem and ca.cert.pem
2. Replace the 192.0.0.x IPs in telegraf.conf with devices that you want to monitor
3. Replace the 192.0.0.1 IP in grafana/dashboards file
4. Run ./provision.sh to start the docker-compose

Press Ctrl+C to stop

5. Run ./cleanup.sh to clean volumes and containers.
