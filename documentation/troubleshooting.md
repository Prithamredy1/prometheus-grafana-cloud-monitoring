# Troubleshooting and failure tests
| Test | Action | Expected |
|---|---|---|
| High CPU | `scripts/cpu-load.sh 60` | CPU graph rises, then recovers |
| High memory | `scripts/memory-load.sh 512 60` | Memory graph rises (keep below VM RAM) |
| Exporter down | `scripts/exporter-failure-test.sh` | Target DOWN, status panel red, `ExporterDown` fires |
| Prometheus down | `docker compose stop prometheus` | Grafana panels show no fresh data |
| Reboot | `sudo reboot` | Uptime resets; containers return (`restart: unless-stopped`) |

**Target DOWN?** `docker compose ps`; `curl localhost:9100/metrics`; check the firewall and the `host.docker.internal` mapping; read `docker compose logs prometheus`.
**Grafana "No data"?** Datasource URL must be `http://prometheus:9090`; check the time range and that targets are UP.
**Disk test:** only on a disposable VM; never fill the root filesystem completely.
Record real observations and screenshots for each test in `screenshots/05-alert-testing/`.
