#!/bin/bash
set -eu

echo "Installing doom-emacs..."

# clone doom-emacs repo as needed
if [ ! -d "${HOME}"/.emacs.d/bin ]; then
    git clone https://github.com/hlissner/doom-emacs "${HOME}/.emacs.d"
fi

# upgrade doom in case it's already installed
doom upgrade

# clone personal config
if [ ! -d "${HOME}"/.doom.d ]; then
    git clone https://github.com/jspawar/doom-emacs-config "${HOME}/.doom.d"
fi

# fetch latest version of personal config
pushd "${HOME}"/.doom.d > /dev/null
    echo "Fetching latest version of personal doom-emacs config..."
    git pull
popd > /dev/null

# install doom as needed
if [ ! -d "${HOME}"/.emacs.d/.local/straight/repos/rspec-mode ]; then
    doom install
fi

# sync in case doom was already installed
doom sync
