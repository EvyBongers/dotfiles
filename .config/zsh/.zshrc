# Source files for initializing zsh
if [[ -d "${XDG_CONFIG_HOME}/zsh/init" ]]; then
    for file in $(find -L "${XDG_CONFIG_HOME}/zsh/init" -type f |sort); do
        [[ -r "${file}" ]] && source "${file}"
    done
fi

# Load OhMyZSH
if [[ -f "${ZSH}/oh-my-zsh.sh" ]]; then
    source "${ZSH}/oh-my-zsh.sh"
fi

# Source additional zsh files
if [[ -d "${XDG_CONFIG_HOME}/zsh" ]]; then
    for file in $(find -L "${XDG_CONFIG_HOME}/zsh" -type f -name '*.zsh' |sort); do
        [[ -r "${file}" ]] && source "${file}"
    done
fi
