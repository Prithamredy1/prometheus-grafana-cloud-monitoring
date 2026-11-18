# Prometheus configuration
- `scrape_interval: 15s` - how often targets are polled; `evaluation_interval` - how often alert rules run.
- Jobs: `prometheus` (self) and `node_exporter` (target `host.docker.internal:9100`, labelled `instance="ubuntu-lab-01"`).
- Reload after edits: `curl -X POST localhost:9090/-/reload` (lifecycle API enabled; keep Prometheus bound to localhost or protected).
Concepts to know: *metric, label, counter, gauge, rate, aggregation*. Counters like `node_cpu_seconds_total` are wrapped in `rate()`; gauges like `node_memory_MemAvailable_bytes` are used directly.
