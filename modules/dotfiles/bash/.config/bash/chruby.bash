# chruby should not be configured for Codespaces
if [ -z "${CODESPACES}" ]; then
    source "$(brew --prefix)"/share/chruby/chruby.sh
    source "$(brew --prefix)"/share/chruby/auto.sh
fi
