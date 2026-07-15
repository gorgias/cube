#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
"$root/scripts/rulesync" generate \
  --input-root "$root" \
  --output-roots "$root" \
  --targets agentsmd,claudecode \
  --features rules \
  --delete \
  "$@"
