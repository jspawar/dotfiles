#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing various utilities via homebrew..."

# install shared/common bundle
brew bundle install --file="${SCRIPT_DIR}/Brewfile"

# install OS-specific bundles
os="$(uname)"
case "${os}" in
    "Darwin")
        brew bundle install --file="${SCRIPT_DIR}"/Brewfile-macos
        ;;
    "Linux")
        # install bundles that regular Linux and Codespace machines will both need (e.g. emacs)
        brew bundle install --file="${SCRIPT_DIR}"/Brewfile-linux
        # install non-Codespace stuff (e.g. install all languages)
        if [ -z "${CODESPACES}" ]; then
            brew bundle install --file="${SCRIPT_DIR}"/Brewfile-linux-all
        fi
        ;;
    *)
        echo "Cannot install Homebrew bundle for unsupported OS: '${os}'"
        exit 1
        ;;
esac
