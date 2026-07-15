#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
"$root/scripts/generate-rulesync.sh" --silent
git -C "$root" diff --exit-code -- AGENTS.md CLAUDE.md
