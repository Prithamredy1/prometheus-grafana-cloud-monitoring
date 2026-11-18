# Alerting
Rules live in `prometheus/alerts.yml`. See them in Prometheus > Alerts (inactive / pending / firing).
Test: run `scripts/cpu-load.sh 180` - `HighCPUUsage` should go pending, then firing after the `for` period. Stop the exporter - `ExporterDown` fires after 1 min.
Lab `for` values are short on purpose. Notifications need Alertmanager (or Grafana alerting) and are a planned next step - do not claim them until built.
