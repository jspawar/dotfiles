#!/bin/bash
set -euo pipefail

# this is entirely macOS-specific
if [ "$(uname)" = "Linux" ]; then
    exit 0
fi

echo "Installing xcode command line tools..."
sudo xcode-select --install
