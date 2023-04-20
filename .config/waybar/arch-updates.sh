#!/usr/bin/env zsh
#
# Dependencies:
# - checkupdates (provided by pacman-contrib)
# - yay (optional, for checking AUR packages)
# - jq
if [[ "${ZSH_EVAL_CONTEXT}" != "toplevel" ]]; then
    return 1
fi

set -o pipefail
set -o errexit
set -o nounset

declare -r lockfile="${XDG_RUNTIME_DIR}/arch-updates.lock"
declare -r cache_file="${XDG_RUNTIME_DIR}/updates.json"
declare -A update_cmds

update_cmds[repo]="checkupdates"
update_cmds[aur]="yay -Qua"

zmodload zsh/system

function fetch_updates() {
    (
    zsystem flock -t 0.5 "${lockfile}" || exit 0

    for origin cmd in "${(kv)update_cmds[@]}"; do
        local prog="${${(As. .)cmd}[1]}"
        [[ ${+commands[${prog}]} -eq 1 ]] || continue
        { "${(As. .)cmd}" 2>/dev/null || true } |
            jq --raw-input --slurp \
            --arg origin "${origin}" \
            ' rtrimstr("\n")
            | split("\n")
            | { "\($origin)": map( split(" ")
                                 | { "pkg": .[0],
                                     "old": .[1],
                                     "new": .[3]
                                   }
                                 )
              }'
    done |jq --slurp 'add' > "${cache_file}"

    wait
    )
}

function main() {
    [[ -f "${lockfile}" ]] || touch "${lockfile}"

    fetch_updates

    zsystem flock -r "${lockfile}"

    jq -c -M ' . as $updates
             | ( "Updates: \( $updates
                            | map(length)
                            | join("/")
                            )"
               ) as $text
             | ( if $updates |add |length > 0
                 then "pending"
                 else "ok"
                 end
               ) as $class
             | ( $updates | to_entries
                          | map( .key as $key
                               | .value
                               | map( "\(.pkg) (\($key))" )
                               )
                          | add
                          | join("\n")
                          | if . == "" then "All done!" else . end
               ) as $tooltip
             | { "text": $text
               , "class": $class
               , "tooltip": $tooltip
               }
             ' "${cache_file}"
}

main "${@}"
