umask 022

export LANG="en_US.UTF-8"

EDITOR=vim
GIT_EDITOR=${EDITOR}
GREP=grep
PAGER=less
export EDITOR GIT_EDITOR GREP PAGER

PATH="${HOME}/.local/bin:${PATH}"
test -d "${HOME}/.cargo/bin" && PATH="${HOME}/.cargo/bin:${PATH}"
export PATH
