#!/bin/bash
set -euo pipefail

dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

stow_package() {
  stow --no-folding --restow --target="$HOME" --dir="$dir/$1" stow
}

stow_package common

case "$(uname)" in
Linux) stow_package linux ;;
Darwin) stow_package mac ;;
esac
