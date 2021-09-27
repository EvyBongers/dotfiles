# Be explicit about XDG directories
XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"
XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

function chkbin() { command -v "${1}" &>/dev/null }
chkbin pyenv && export PYENV_ROOT="${HOME}/.pyenv"
chkbin go    && export GOPATH="${HOME}/go" PATH="${GOPATH}/bin:${PATH}"
chkbin vim   && export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc"
unset -f chkbin

[[ -d "${HOME}/.local/bin" ]] && PATH="${HOME}/.local/bin:${PATH}"
[[ -d "${HOME}/.cargo/bin" ]] && PATH="${HOME}/.cargo/bin:${PATH}"
export PATH

CDPATH="${HOME}"
[[ -d "${HOME}/git" ]] && CDPATH="${CDPATH}:${HOME}/git"
export CDPATH
