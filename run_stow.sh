#!/bin/bash
set -euo pipefail

dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

stow_here() {
  stow --no-folding --restow --target="$HOME" --dir="$dir" "$@"
}

stow_here common

case "$(uname)" in
  Linux)  stow_here linux ;;
  Darwin) stow_here mac ;;
esac
