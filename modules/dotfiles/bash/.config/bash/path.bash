# golang
if [ -z "${CODESPACES}" ]; then
    export PATH="${HOME}/go/bin:$PATH"
fi

# doom-emacs CLI
export PATH="${HOME}/.emacs.d/bin:$PATH"

# rust-lang
if [ -z "${CODESPACES}" ]; then
    export PATH="${HOME}/.cargo/bin:$PATH"
fi
