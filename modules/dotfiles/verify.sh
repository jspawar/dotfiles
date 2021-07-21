#!/bin/bash
set -euxo pipefail

# bash
test -f "${HOME}/.bashrc"
test -f "${HOME}/.bash_profile"
test -f "${HOME}/.inputrc"
test -d "${HOME}/.config/bash"

# git
test -f "${HOME}/.gitconfig"
test "$(git config --get alias.br)" = "branch"

# TODO: move this into a `work` branch?
# verify macOS keychain manager config only on macOS
os="$(uname)"
if [ "${os}" = "Darwin" ]; then
    test "$(git config --get credential.helper)" = "osxkeychain"
fi

# chruby
# only verify for non-Codespace machines
if [ -z "${CODESPACES}" ]; then
    test -f "${HOME}/.ruby-version"
fi
