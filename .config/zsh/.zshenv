function chkbin() { command -v "${1}" &>/dev/null }
chkbin pyenv && { export PYENV_ROOT="${HOME}/.pyenv"; PATH="${PYENV_ROOT}/bin:${PATH}" }
unset -f chkbin

export PATH
