#!/usr/bin/env bash
set -euo pipefail

find -L "$HOME" \
  \( -path '*/Library' -o -path '*/.local/state' -o -path '*/.Trash' \) -prune \
  -o -type l -exec rm -v {} +
