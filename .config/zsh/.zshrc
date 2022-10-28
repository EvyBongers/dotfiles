# Source files for initializing zsh
for file in "${ZDOTDIR}/init"/*; do
    [[ -r "${file}" ]] && source "${file}"
done

if [[ -o interactive ]]; then
    # Load OhMyZSH
    [[ -f "${ZSH}/oh-my-zsh.sh" ]] && source "${ZSH}/oh-my-zsh.sh"
fi

# Source additional zsh files
for file in "${ZDOTDIR}"/*.zsh; do
    [[ -r "${file}" ]] && source "${file}"
done

unset file
