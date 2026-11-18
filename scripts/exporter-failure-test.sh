#!/usr/bin/env bash
# Stops Node Exporter, waits, then restarts it. Run from the docker/ directory.
set -euo pipefail
docker compose stop node-exporter
echo "Exporter stopped. Check Prometheus > Status > Targets (DOWN) and the Server Status panel."
read -rp "Press Enter to restart the exporter... "
docker compose start node-exporter
echo "Exporter started. The target should return to UP within ~15-30 s."
