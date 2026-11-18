#!/usr/bin/env bash
# Controlled memory load. Default 512 MB for 60 s - keep it well below the VM's RAM.
set -euo pipefail
MB="${1:-512}"; SECS="${2:-60}"
command -v stress-ng >/dev/null || { echo "Install stress-ng first: sudo apt install stress-ng"; exit 1; }
stress-ng --vm 1 --vm-bytes "${MB}M" --timeout "${SECS}s"
