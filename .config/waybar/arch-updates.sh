#!/bin/bash
#
# Dependencies:
# - wc (provided by coreutils)
# - checkupdates (provided by pacman-contrib)
# - yay (optional, for checking AUR packages)

set -o pipefail
set -o errexit
set -o nounset

function main() {
    local num_repo_upgrades num_aur_upgrades
    num_repo_upgrades=$( (checkupdates |wc -l) || exit 0)
    if (command -v yay && yay --version) &>/dev/null; then
        num_aur_upgrades=$( (yay -Qua 2>/dev/null |wc -l) || true)
    fi

    if [[ ${num_repo_upgrades} == 0 && ${num_aur_upgrades:-0} == 0 ]]; then
        echo "System up-to-date"
    elif [[ -z "${num_aur_upgrades:-}" ]]; then
        echo "Upgrades: ${num_repo_upgrades}"
    else
        echo "Upgrades: ${num_repo_upgrades}/${num_aur_upgrades}"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
