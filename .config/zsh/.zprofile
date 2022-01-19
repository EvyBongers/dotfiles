umask 022

export GOPATH="${HOME}/go"

PATH="${HOME}/.local/bin:${PATH}"
PATH="${HOME}/.go/bin:${PATH}"
PATH="${HOME}/.cargo/bin:${PATH}"
export PATH

CDPATH="${HOME}"
[[ -d "${HOME}/git" ]] && CDPATH="${CDPATH}:${HOME}/git"
export CDPATH
