#!/bin/bash
set -eux

# this is entirely macOS-specific
if [ "$(uname)" = "Linux" ]; then
    exit 0
fi

xcode-select -p
