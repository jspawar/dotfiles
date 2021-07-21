#!/bin/bash
set -eu

echo "Installing homebrew..."

os="$(uname)"
# TODO: move prerequisites for linux install to its own module?
if [ "${os}" = "Linux" ]; then
    apt-get update
    apt-get install build-essential procps curl file git -y
    # install Homebrew without prompt since I will most likely be using this in a codespace
    export NONINTERACTIVE=1
fi

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
