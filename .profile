umask 022

export GOPATH="${HOME}/go"

PATH="${HOME}/.local/bin:${PATH}"
PATH="${HOME}/.go/bin:${PATH}"
PATH="${HOME}/.cargo/bin:${PATH}"
export PATH

# Force Firefox on X11 to use D-Bus remote protocol
# Needed for opening urls from programs running under xwayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
