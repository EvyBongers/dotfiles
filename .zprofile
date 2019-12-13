umask 022

EDITOR=vim
GIT_EDITOR=${EDITOR}
GREP=grep
PAGER=less

LANG="en_US.UTF-8"

# for ease of use, include the helper scripts dir in PATH
GIT_DIR="$(realpath "$(dirname "$(readlink "${HOME}/.zprofile")")")"
test -d "${GIT_DIR}/scripts" && PATH="${PATH}:${GIT_DIR}/scripts"

# set PATH so it includes user's private bin if it exists
test -d "${HOME}/bin" && PATH="${HOME}/bin:${PATH}"
test -d "${HOME}/.local/bin" && PATH="${HOME}/.local/bin:${PATH}"
test -d "${HOME}/.cargo/bin" && PATH="${HOME}/.cargo/bin:${PATH}"

export EDITOR GIT_EDITOR GREP LANG PAGER PATH
