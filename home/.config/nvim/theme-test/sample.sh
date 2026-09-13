#!/usr/bin/env bash
# Verdigris shell sample

set -euo pipefail

THEME_NAME="verdigris"
FILES=(sample.lua sample.rs sample.py sample.md sample.json)

log() {
  printf '[%s] %s\n' "$THEME_NAME" "$1"
}

for file in "${FILES[@]}"; do
  if [[ -f "$file" ]]; then
    log "found $file"
  else
    log "missing $file"
  fi
done

case "${1:-preview}" in
  preview)
    log "open these files in Neovim to inspect highlighting"
    ;;
  error)
    echo "simulated error" >&2
    exit 1
    ;;
  *)
    log "unknown command: $1"
    ;;
esac
