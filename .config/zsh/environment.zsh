export KEYTIMEOUT=1
export CDPATH="${HOME}"

if command -v pyenv &>/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
fi

if command -v go &>/dev/null; then
    export GOPATH="${HOME}/go"
    export PATH="${GOPATH}/bin:$PATH"
fi
