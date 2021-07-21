#!/bin/bash
set -eux

# for Codespaces, only install utilities if golang is installed (i.e. avoid installing golang stuff for a Ruby project)
if [ -n "${CODESPACES}" ]; then
    set +e
    if [ -z "$(command -v go)" ]; then
        echo "Skip verifying golang utilities are installed for Codespace which doesn't have golang installed..."
        exit 0
    fi
    set -e
fi

# doom-emacs support
command -v gopls
command -v gocode
command -v godoc
command -v gorename
command -v gore
command -v guru
command -v goimports
command -v gotests
command -v gomodifytags
