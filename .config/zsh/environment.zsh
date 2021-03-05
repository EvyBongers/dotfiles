export KEYTIMEOUT=1
export CDPATH="${HOME}"

XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"

if command -v pyenv &>/dev/null; then
    export PYENV_ROOT="${HOME}/.pyenv"
    eval "$(pyenv init -)"
fi

if command -v go &>/dev/null; then
    export GOPATH="${HOME}/go"
    export PATH="${GOPATH}/bin:${PATH}"
fi

if command -v vim &>/dev/null; then
    # Set vimrc's location and source it on vim startup
    export VIMINIT='let $MYVIMRC="$HOME/.config/vim/vimrc"'
fi
