CDPATH="${HOME}"
[[ -d "${HOME}/git" ]] && CDPATH="${CDPATH}:${HOME}/git"

export CDPATH

if command -v pyenv &>/dev/null; then
    export PYENV_ROOT="${HOME}/.pyenv"
fi

if command -v go &>/dev/null; then
    export GOPATH="${HOME}/go"
    export PATH="${GOPATH}/bin:${PATH}"
fi

if command -v vim &>/dev/null; then
    # Set vimrc's location and source it on vim startup
    export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc"
fi
