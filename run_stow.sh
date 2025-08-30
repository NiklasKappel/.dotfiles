#!/bin/bash

# Get the directory where the script is located
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to that directory
cd "$DIR" || exit

# Run the stow commands
stow --no-folding --adopt common/
if [[ "$(uname)" == "Darwin" ]]; then
  stow --no-folding --adopt mac/
fi
