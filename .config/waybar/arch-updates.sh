#!/usr/bin/env zsh
#
# Dependencies:
# - checkupdates (provided by pacman-contrib)
# - jq
# - wc (provided by coreutils)
# - yay (optional, for checking AUR packages)
if [[ "${ZSH_EVAL_CONTEXT}" != "toplevel" ]]; then
    return 1
fi

set -o pipefail
set -o errexit
set -o nounset

function main() {
    local class="ok"
    local -a repo_upgrades aur_upgrades all_upgrades

    repo_upgrades=( $( (checkupdates |cut -d' ' -f1) || exit 0 ) )
    text="Updates: ${#repo_upgrades[@]}"

    if [[ ${+commands[yay]} ]]; then
        aur_upgrades=( $( (yay -Qua |cut -d' ' -f1) || true ) )
        text+="/${#aur_upgrades[@]}"
    fi

    all_upgrades=(
        "${^repo_upgrades[@]} (repo)"
        "${^aur_upgrades[@]} (aur)"
    )

    if [[ ${#all_upgrades[@]} -gt 0 ]]; then
        class="pending"
    fi

    jq -c -M -n '$ARGS.named' \
        --arg text "${text}" \
        --arg class "${class}" \
        --arg tooltip "${(F)all_upgrades:-All done!}"
}

main "${@}"
