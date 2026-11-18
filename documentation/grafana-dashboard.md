# Dashboard queries
| Panel | PromQL |
|---|---|
| Server Status | `up{job="node_exporter"}` (1 = UP, 0 = DOWN) |
| Uptime | `time() - node_boot_time_seconds` |
| CPU % | `100 * (1 - avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[$__rate_interval])))` |
| Memory % | `100 * (1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)` |
| Disk % (/) | `100 * (1 - node_filesystem_avail_bytes{mountpoint="/",fstype!~"tmpfs\|overlay"} / node_filesystem_size_bytes{...})` |
| Network in/out | `rate(node_network_receive_bytes_total[...])`, `rate(node_network_transmit_bytes_total[...])` |
| Load | `node_load1`, `node_load5`, `node_load15` (compare with CPU core count) |
| Disk I/O | `rate(node_disk_read_bytes_total[...])`, `rate(node_disk_written_bytes_total[...])` |

The dashboard is auto-loaded from `grafana/dashboards/`. If you edit it in the UI, export the JSON and commit it. Thresholds (70/90 % etc.) are lab values, not universal limits.
