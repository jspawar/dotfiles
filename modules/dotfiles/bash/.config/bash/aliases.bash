# this
# TODO: add this to path for Codespaces too
if [ -z "${CODESPACES}" ]; then
    alias pave='${HOME}/workspace/dotfiles/pave'
fi

# emacs
alias vim='emacs -nw'

# ll
alias ll='ls -laG'

# git
alias gs='git status'
alias gd='git diff'
