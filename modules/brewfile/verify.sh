#!/bin/bash
set -eux

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# verify shared/common bundle
brew bundle check --file="${SCRIPT_DIR}/Brewfile"

# install OS-specific bundles
os="$(uname)"
case "${os}" in
    "Darwin")
        brew bundle check --file="${SCRIPT_DIR}"/Brewfile-macos
        ;;
    "Linux")
        brew bundle check --file="${SCRIPT_DIR}"/Brewfile-linux
        ;;
    *)
        echo "Cannot install Homebrew bundle for unsupported OS: '${os}'"
        exit 1
        ;;
esac
