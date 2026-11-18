#!/usr/bin/env bash
# Controlled CPU load for ~60 s. Run on the lab VM only.
set -euo pipefail
SECS="${1:-60}"; CORES="$(nproc)"
if command -v stress-ng >/dev/null; then stress-ng --cpu "$CORES" --timeout "${SECS}s"
else
  echo "stress-ng not found (sudo apt install stress-ng); using a built-in busy loop"
  for _ in $(seq "$CORES"); do timeout "$SECS" sh -c 'while :; do :; done' & done; wait || true
fi
echo "CPU test finished - watch the graph fall back."
