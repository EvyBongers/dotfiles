CDPATH="${HOME}"
# ${HOME}/projcts/{scope}/{repo}
for dir in "${HOME}/projects"/*; do
    CDPATH="${CDPATH}:${dir}"
done
export CDPATH

function chkbin() { command -v "${1}" &>/dev/null }
chkbin pyenv && { export PYENV_ROOT="${HOME}/.pyenv"; PATH="${PYENV_ROOT}/bin:${PATH}" }
unset -f chkbin

export PATH
