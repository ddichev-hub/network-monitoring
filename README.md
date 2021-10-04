# network-monitoring

Testing monitoring devices via GRPC with Telegraf, InfluxDB and Grafana

The example has dummy IPs and doesn't include client certificates. 

1. Obtain CA cer, client cert and key and place them in telegraf/etc.
    - Note the name of the files are specified in file telegraf/etc/telegraf.conf, section  [[inputs.gnmi ]] with variables tls_ca,tls_cert, tls_key 
2. Change variables in configuration.env
4. Run ./provision.sh to start the docker-compose

Press Ctrl+C to stop

5. Run ./cleanup.sh to clean volumes and containers.
