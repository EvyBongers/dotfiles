CDPATH="${HOME}"
# ${HOME}/projcts/{scope}/{repo}
[[ -d "${HOME}/projects" ]] &&
    for dir in "${HOME}/projects"/*; do
        [[ -d "${dir}" ]] || continue
        CDPATH="${CDPATH}:${dir}"
    done
export CDPATH
