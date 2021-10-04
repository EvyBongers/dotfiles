umask 022

export LANG="en_US.UTF-8"

EDITOR=vim
GIT_EDITOR=${EDITOR}
GREP=grep
PAGER=less
export EDITOR GIT_EDITOR GREP PAGER

# Be explicit about XDG directories
XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"
XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME

GOPATH="${HOME}/go"
export GOPATH

PATH="${HOME}/.local/bin:${PATH}"
PATH="${HOME}/.go/bin:${PATH}"
PATH="${HOME}/.cargo/bin:${PATH}"
export PATH

CDPATH="${HOME}"
[[ -d "${HOME}/git" ]] && CDPATH="${CDPATH}:${HOME}/git"
export CDPATH
