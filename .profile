umask 022

export LANG="en_US.UTF-8"

# Be explicit about XDG base directories
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Default editor and pager
export EDITOR=vim
export PAGER=less

# Be explicit about these as well
export GIT_EDITOR="${EDITOR}"
export MANPAGER="${PAGER}"

export GOPATH="${XDG_DATA_HOME}/go"
export PATH="${HOME}/.local/bin:${PATH}"

# Move dot files out of $HOME
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export VIMINIT="source ${XDG_CONFIG_HOME}/vim/vimrc"
