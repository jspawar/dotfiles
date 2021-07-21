#!/bin/bash
set -eu

echo "Installing Rust and supporting utilities..."

# won't need Rust for Codespaces (yet...)
if [ -n "${CODESPACES}" ]; then
    echo "Skip installing Rust utilities for Codespace cuz won't be using them together (yet)..."
    exit 0
fi

# TODO: get latest version of Rust

# TODO: if there is no/old version of Rust installed, install or update to latest
if [ -z "$(command -v rustup)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

    # reload current bash session so that verification correctly finds Rust utilities in path
    source "${HOME}"/.bashrc
elif [ -s "$(rustup check | grep "Update available")" ]; then
    # TODO: update Rust toolchain
    echo "Update for Rust is available, updating..."
fi
