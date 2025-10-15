#!/bin/bash

set -e

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
PACKAGE_DIR="$SCRIPT_DIR/my-metapackage"
PACKAGE_FILE="$SCRIPT_DIR/my-metapackage.deb"

echo "Building package..."
dpkg-deb --root-owner-group --build "$PACKAGE_DIR" "$PACKAGE_FILE"

echo "Installing package..."
sudo apt install "$PACKAGE_FILE"

echo "Running autoremove..."
sudo apt autoremove

echo "Deleting package file..."
rm -v "$PACKAGE_FILE"

echo "Done."

