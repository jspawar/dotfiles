#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}"/find_latest_ruby_version.sh

echo "Installing Ruby and Ruby utilities..."

# for Codespaces, only install utilities if Ruby is installed (i.e. avoid installing golang stuff for a Ruby project)
if [ -n "${CODESPACES}" ]; then
    set +e
    if [ -z "$(command -v ruby)" ]; then
        echo "Skip installing Ruby utilities for Codespace which doesn't have Ruby installed..."
        exit 0
    fi
    set -e
fi

# only configure chruby stuff for non-Codespace machines
if [ -z "${CODESPACES}" ]; then
    # install latest Ruby 2.x as needed
    readonly latest_ruby2_version="$(find_latest_ruby2_version)"
    if [ ! -d "${HOME}"/.rubies/ruby-"${latest_ruby2_version}" ]; then
        echo "Installing latest Ruby 2.x..."
        ruby-install ruby "${latest_ruby2_version}"

        # reload bash so that chruby recognizes the newly installed version in this shell
        source "${HOME}"/.bashrc
    fi

    # TODO: install absolute latest version of Ruby

    # ensure default chruby version is latest Ruby 2.x
    echo "ruby-${latest_ruby2_version}" > "${HOME}"/.ruby-version

    # install various Ruby utilities
    echo "Ensuring Ruby environment is setup correctly..."
    test "$(which gem)" = "${HOME}/.rubies/ruby-${latest_ruby2_version}/bin/gem"
fi

echo "Installing various Ruby utilities..."
# TODO: replace with a Gemfile?
gem install solargraph
