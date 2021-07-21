#!/bin/bash
set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}"/find_latest_ruby_version.sh

# for Codespaces, only verify utilities if Ruby is installed (i.e. avoid installing golang stuff for a Ruby project)
if [ -n "${CODESPACES}" ]; then
    set +e
    if [ -z "$(command -v ruby)" ]; then
        echo "Skip verifying Ruby utilities for Codespace which doesn't have Ruby installed..."
        exit 0
    fi
    set -e
fi

# verify chruby config only for non-Codespace machines
if [ -z "${CODESPACES}" ]; then
    # verify latest Ruby 2.x is installed
    readonly latest_ruby2_version="$(find_latest_ruby2_version)"
    test -d "${HOME}/.rubies/ruby-${latest_ruby2_version}"

    # verify default chruby-selected Ruby version is latest 2.x
    test "$(cat "${HOME}/.ruby-version")" = "ruby-${latest_ruby2_version}"

    # verify chruby is using latest installed Ruby 2.x
    test "${RUBY_ROOT}" = "${HOME}/.rubies/$(cat "${HOME}/.ruby-version")"
fi

# verify various utilities are installed
command -v solargraph
