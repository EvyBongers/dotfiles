#!/bin/bash
#
# Dependencies:
# - makepkg utils (provided by pacman)
# - wc (provided by coreutils)
# - checkupdates (provided by pacman-contrib)
# - yay (optional, for checking AUR packages)

set -o pipefail
set -o errexit
set -o nounset

# parseopts.sh is provided by the pacman package
[[ -r /usr/share/makepkg/util/parseopts.sh ]] &&
    source /usr/share/makepkg/util/parseopts.sh

function check_updates() {
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

function main() {
    check_updates
    if [[ ${WATCH:-0} == 1 ]]; then
        while true; do
            sleep "${TIMEOUT:-600}"
            check_updates
        done
    fi
}

trap 'kill $(jobs -p)' SIGCHLD

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    OPT_SHORT='wt:'
    OPT_LONG=('watch', 'timeout')
    parseopts "${OPT_SHORT}" "${OPT_LONG[@]}" -- "${@}" || exit 1

    set -- "${OPTRET[@]}";
    unset OPTRET OPT_LONG OPT_SHORT
    while :; do
        case "${1}" in
            -w|--watch)
                WATCH=1 ;;
            -t|--timeout)
                TIMEOUT=${2}
                shift ;;
            --)
                shift
                break ;;
        esac
        shift
    done

    main
fi
