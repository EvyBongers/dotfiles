function home_local_branch() {
    declare -a cmds=(
        "hostnamectl --static"
        "sysctl -n kernel.hostname"
        "hostname -s"
    )
    for cmd in "${cmds[@]}"; do
        command -v "${cmd%% *}" &>/dev/null || continue
        eval "${cmd}" 2>/dev/null && return
    done
}
function home_current_branch() {
    declare -a cmds=(
        "home branch --show-current"
        "home symbolic-ref --quiet HEAD |sed 's@^refs/heads/@@'"
    )
    for cmd in "${cmds[@]}"; do
        eval "${cmd}" 2>/dev/null && return
    done
}
function hsw() {
    local current_branch local_branch target_branch

    declare -r current_branch="$(home_current_branch)"
    declare -r local_branch="${1:-$(home_local_branch)}"

    if [[ -z "${current_branch:-}" ]]; then
        echo "Currently in detached head" >&2
        return 1
    elif [[ -z "${local_branch:-}" ]]; then
        echo "Failed to determine local branch" >&2
        return 1
    elif [[ "${current_branch}" == "main" ]]; then
        target_branch="${local_branch}"
    else
        target_branch="main"
    fi

    echo "switching to branch '${target_branch}'"
    home switch "${target_branch}" 2>/dev/null ||
        home switch -c "${target_branch}"
}
