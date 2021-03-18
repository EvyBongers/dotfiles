umask 022

EDITOR=vim
GIT_EDITOR=${EDITOR}
GREP=grep
PAGER=less

LANG="en_US.UTF-8"

# include the user's private bin in PATH if it exists
test -d "${HOME}/.local/bin" && PATH="${HOME}/.local/bin:${PATH}"
# include Cargo bin in PATH if it exists
test -d "${HOME}/.cargo/bin" && PATH="${HOME}/.cargo/bin:${PATH}"

export EDITOR GIT_EDITOR GREP LANG PAGER PATH
