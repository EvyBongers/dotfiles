#!/bin/bash
#
# Dependencies:
# - checkupdates (provided by pacman-contrib)
# - jq
# - wc (provided by coreutils)
# - yay (optional, for checking AUR packages)

set -o pipefail
set -o errexit
set -o nounset

function main() {
    local num_repo_upgrades num_aur_upgrades
    local text="System up-to-date"
    local class="ok"

    num_repo_upgrades=$( (checkupdates |wc -l) || exit 0)
    if (command -v yay && yay --version) &>/dev/null; then
        num_aur_upgrades=$( (yay -Qua 2>/dev/null |wc -l) || true)
    fi

    if [[ $[num_repo_upgrades+${num_aur_upgrades:-0}] -gt 0 ]]; then
        class="pending"
        if [[ -z "${num_aur_upgrades:-}" ]]; then
            text="Updates: ${num_repo_upgrades}"
        else
            text="Updates: ${num_repo_upgrades}/${num_aur_upgrades}"
        fi
    fi

    jq -c -M -n '$ARGS.named' \
        --arg text "${text}" \
        --arg class "${class}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
