function switch_branch() {
    local current_branch local_branch target_branch

    current_branch="$(home rev-parse --abbrev-ref HEAD)"

    if command -v hostname &>/dev/null; then
        local_branch="$(hostname -s)"
    elif command -v hostnamectl &>/dev/null; then
        local_branch="$(hostnamectl --static)"
    fi

    if [[ "${local_branch:-}" == "" ]]; then
        echo "Failed to determine local branch" >&2
        return 1
    fi

    if [[ "${current_branch}" == "main" ]]; then
        target_branch="${local_branch}"
        # Create the local branch if it does not exist
        home branch -l "${local_branch}" |grep -q "${local_branch}" ||
            git --git-dir="${HOME}/.files.git" --work-tree="${HOME}" branch "${target_branch}"
    else
        target_branch="main"
    fi

    echo "switching to branch '${target_branch}'"
    git --git-dir="${HOME}/.files.git" --work-tree="${HOME}" checkout "${target_branch}"
}
