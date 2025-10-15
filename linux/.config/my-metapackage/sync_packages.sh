#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$SCRIPT_DIR/my-metapackage"
PACKAGE_FILE="$SCRIPT_DIR/my-metapackage.deb"

echo "Building package..."
dpkg-deb --root-owner-group --build "$PACKAGE_DIR"

echo "Installing package..."
sudo apt install "$PACKAGE_FILE"

echo "Running autoremove..."
sudo apt autoremove

echo "Deleting package file..."
rm -v "$PACKAGE_FILE"

echo "Done."

