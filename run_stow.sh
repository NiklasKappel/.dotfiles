#!/bin/bash

# Get the directory where the script is located
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to that directory
cd "$dir" || exit

# Run the stow commands
stow --no-folding --adopt common/
if [[ "$(uname)" == "Linux" ]]; then
  stow --no-folding --adopt linux/
elif [[ "$(uname)" == "Darwin" ]]; then
  stow --no-folding --adopt mac/
fi
