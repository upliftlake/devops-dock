# CAdvisor to view Docker Metrics 

## run the docker container
```sh
docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:ro --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/dev/disk/:/dev/disk:ro --publish=4444:8080 --detach=true --name=cadvisor --device=/dev/kmsg gcr.io/cadvisor/cadvisor:v0.49.1
```

## add the scrape source to /etc/prometheus/prometheus.yml
```sh
- job_name: 'cadvisor'
    static_configs:
    - targets: ['cadvisor-ip:4444']
```

## add these dashboards to grafana
```sh
panel1-14282
panel2-19792 (only for docker compose)
```

## for further reading
https://github.com/google/cadvisor
https://medium.com/@varunjain2108/monitoring-docker-containers-with-cadvisor-prometheus-and-grafana-d101b4dbbc84
