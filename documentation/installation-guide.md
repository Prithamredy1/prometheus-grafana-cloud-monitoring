# Installation guide
1. Install Ubuntu Server in VMware (NAT or host-only network). Note its IP: `ip a`.
2. Install Docker (official repo): follow https://docs.docker.com/engine/install/ubuntu/ then `sudo usermod -aG docker $USER` and log in again.
3. `docker --version && docker compose version`
4. Clone the repo, `cd docker`, `cp .env.example .env`, set a strong `GRAFANA_ADMIN_PASSWORD`. To browse from your Windows host set `BIND_ADDR=0.0.0.0` (lab network only).
5. `docker compose up -d` then `docker compose ps` (all three running).
6. Verify: `curl -s localhost:9100/metrics | head`, Prometheus `http://<ip>:9090/targets` (both UP), Grafana `http://<ip>:3000`.
7. Validate config: `docker run --rm -v $PWD/../prometheus:/p --entrypoint promtool prom/prometheus:v2.53.0 check config /p/prometheus.yml`.

**Without Docker:** install the three binaries/packages directly, set the scrape target to `localhost:9100` and copy the provisioning files to `/etc/grafana/provisioning/`.
