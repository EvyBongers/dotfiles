umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    test -f "${HOME}/.bashrc" && source "${HOME}/.bashrc"
fi

EDITOR=vim
GIT_EDITOR=${EDITOR}
GREP=grep
PAGER=less

LANG="en_US.UTF-8"
# Be explicit about XDG directories
XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME

# include the user's private bin in PATH if it exists
test -d "${HOME}/.local/bin" && PATH="${HOME}/.local/bin:${PATH}"
# include Cargo bin in PATH if it exists
test -d "${HOME}/.cargo/bin" && PATH="${HOME}/.cargo/bin:${PATH}"

export EDITOR GIT_EDITOR GREP LANG PAGER PATH

# Force Firefox on X11 to use D-Bus remote protocol
export MOZ_DBUS_REMOTE=1
