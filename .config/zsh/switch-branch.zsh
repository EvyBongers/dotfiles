function switch_branch() {
    local current_branch local_branch target_branch

    current_branch="$(git_current_branch)"

    if command -v hostname &>/dev/null; then
        local_branch="$(hostname -s)"
    elif command -v hostnamectl &>/dev/null; then
        local_branch="$(hostnamectl --static)"
    fi

    if [[ "${local_branch:-}" == "" ]]; then
        echo "Failed to determine local branch" >&2
        return 1
    fi

    if [[ "${current_branch}" == "master" ]]; then
        target_branch="${local_branch}"
    else
        target_branch="master"
    fi

    echo "switching to branch '${target_branch}'"
    git --git-dir="${HOME}/.files.git" --work-tree="${HOME}" checkout "${local_branch}"
}
