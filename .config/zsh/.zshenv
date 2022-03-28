CDPATH="${HOME}"
# ${HOME}/projcts/{scope}/{repo}
for dir in "${HOME}/projects"/*; do
    CDPATH="${CDPATH}:${dir}"
done
export CDPATH
