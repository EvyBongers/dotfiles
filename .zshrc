# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
if [[ ! -d "${ZSH}" ]]; then
  which git &>/dev/null && \
    env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "${ZSH}" && \\
    env git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH}/custom/plugins/zsh-autosuggestions"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="afowler"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  dotenv
  git
  gpg-agent
  screen
  ssh-agent
  vi-mode
  virtualenvwrapper
  zsh-autosuggestions
)

# Store zsh config dump files in ~/.cache/zsh instead of $ZSH_DOTDIR or $HOME
ZSH_COMPDUMP="${HOME}/.cache/zsh/zcompdump-${HOST/.*/}-${ZSH_VERSION}"

if [[ -f "${ZSH}/oh-my-zsh.sh" ]]; then
    source "${ZSH}/oh-my-zsh.sh"
fi

# User configuration

# Source additional zsh files
if [[ -d "${HOME}/.config/zsh" ]]; then
    for file in $(find -L "${HOME}/.config/zsh" -type f -name '*.zsh' |sort); do
        test -r "${file}" && source "${file}"
    done
fi
