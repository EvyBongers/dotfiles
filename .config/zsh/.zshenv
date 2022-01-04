export ZDOTDIR="${XDG_CONFIG_HOME=${HOME}/.config}/zsh"
export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc"

function chkbin() { command -v "${1}" &>/dev/null }
chkbin pyenv && { export PYENV_ROOT="${HOME}/.pyenv"; PATH="${PYENV_ROOT}/bin:${PATH}" }
unset -f chkbin
