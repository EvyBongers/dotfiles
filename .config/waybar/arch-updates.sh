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
    local class num_repo_upgrades num_aur_upgrades

    num_repo_upgrades=$( (checkupdates |wc -l) || exit 0)
    num_aur_upgrades=$( command -v yay &>/dev/null && (yay -Qua 2>/dev/null |wc -l) || true)

    text="Updates: ${num_repo_upgrades}"
    if [[ -n "${num_aur_upgrades:-}" ]]; then
        text+="/${num_aur_upgrades}"
    fi

    if [[ $[num_repo_upgrades+${num_aur_upgrades:-0}] -gt 0 ]]; then
        class="pending"
    else
        class="ok"
    fi

    jq -c -M -n '$ARGS.named' \
        --arg text "${text}" \
        --arg class "${class}"
}

main "${@}"
