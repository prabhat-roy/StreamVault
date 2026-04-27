#!/usr/bin/env bash
set -euo pipefail
NS="${1:-streamvault}"
TS=$(date -u +%Y%m%dT%H%M%S)
velero backup create "streamvault-$TS" --include-namespaces "$NS" --wait
