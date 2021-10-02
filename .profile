umask 022

export LANG="en_US.UTF-8"

EDITOR=vim
GIT_EDITOR=${EDITOR}
GREP=grep
PAGER=less
export EDITOR GIT_EDITOR GREP PAGER

# Be explicit about XDG directories
XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"
XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME

GOROOT="${HOME}/go"
GOBIN="${GOROOT}/bin"
export GOROOT GOBIN

PATH="${HOME}/.local/bin:${PATH}"
PATH="${HOME}/.go/bin:${PATH}"
PATH="${HOME}/.cargo/bin:${PATH}"
export PATH

CDPATH="${HOME}"
test -d "${HOME}/git" && CDPATH="${CDPATH}:${HOME}/git"
export CDPATH

# Force Firefox on X11 to use D-Bus remote protocol
# Needed for opening urls from programs running under xwayland
export MOZ_DBUS_REMOTE=1
