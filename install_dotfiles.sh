#!/bin/bash
set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$dir"

stow --no-folding --adopt common/

if [[ "$(uname)" == "Linux" ]]; then
  stow --no-folding --adopt linux/
elif [[ "$(uname)" == "Darwin" ]]; then
  stow --no-folding --adopt mac/

  # Copy keyboard layout bundle as a real file (not a symlink)
  src="$dir/mac/Library/Keyboard Layouts/EurKEY-Next.bundle"
  dst="$HOME/Library/Keyboard Layouts"
  mkdir -p "$dst"
  rm -rf "$dst/EurKEY-Next.bundle"
  cp -R "$src" "$dst/"
fi
