CDPATH="${HOME}"
[[ -d "${HOME}/git" ]] && CDPATH="${CDPATH}:${HOME}/git"
export CDPATH

function chkbin() { command -v "${1}" &>/dev/null }
chkbin pyenv && export PYENV_ROOT="${HOME}/.pyenv"
chkbin go    && export GOPATH="${HOME}/go" PATH="${GOPATH}/bin:${PATH}"
chkbin vim   && export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc"
unset -f chkbin
