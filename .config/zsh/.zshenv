# Be explicit about XDG directories
XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
