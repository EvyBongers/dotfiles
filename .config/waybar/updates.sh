#!/bin/bash

set -o pipefail
set -o errexit
set -o nounset

NUM_REPO_UPGRADES=$((checkupdates || exit 0) |wc -l)
NUM_AUR_UPGRADES=$(yay -Qua |wc -l)

if [[ ${NUM_REPO_UPGRADES} == 0 && ${NUM_AUR_UPGRADES} == 0 ]]; then
    echo "System up-to-date"
else
    echo "Upgrades: ${NUM_REPO_UPGRADES}/${NUM_AUR_UPGRADES}"
fi
