export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

function chkbin() { command -v "${1}" &>/dev/null }
chkbin pyenv && { export PYENV_ROOT="${HOME}/.pyenv"; PATH="${PYENV_ROOT}/bin:${PATH}" }
chkbin vim   && { export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc" }
unset -f chkbin

