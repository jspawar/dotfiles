#!/bin/bash
set -eux

echo "Installing golang utilities..."

# for Codespaces, only install if golang is installed (i.e. avoid installing golang stuff for a Ruby project)
if [ -n "${CODESPACES}" ]; then
    set +e
    if [ -z "$(command -v go)" ]; then
        echo "Skip installing golang utilities for Codespace which doesn't have golang installed..."
        exit 0
    fi
    set -e
fi

# doom-emacs support
go get -v golang.org/x/tools/gopls@latest
go get -v github.com/motemen/gore/cmd/gore
go get -v github.com/stamblerre/gocode
go get -v golang.org/x/tools/cmd/godoc
go get -v golang.org/x/tools/cmd/goimports
go get -v golang.org/x/tools/cmd/gorename
go get -v golang.org/x/tools/cmd/guru
go get -v github.com/cweill/gotests/...
go get -v github.com/fatih/gomodifytags
