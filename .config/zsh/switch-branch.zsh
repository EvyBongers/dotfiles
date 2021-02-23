function get_short_hostname() {
    if command -v hostnamectl &>/dev/null; then
        hostnamectl --static
        return
    fi
    if command -v sysctl &>/dev/null; then
        sysctl -n kernel.hostname
        return
    fi
    if command -v hostname &>/dev/null; then
        hostname -s
        return
    fi
}
function switch_branch() {
    local current_branch local_branch target_branch

    declare -r current_branch="$(home branch --show-current)"
    if [[ -z "${current_branch:-}" ]]; then
        echo "Currently in detached head" >&2
        return 1
    fi

    declare -r local_branch="${1:-$(get_short_hostname)}"
    if [[ -z "${local_branch:-}" ]]; then
        echo "Failed to determine local branch" >&2
        return 1
    fi

    if [[ "${current_branch}" == "main" ]]; then
        target_branch="${local_branch}"
        # Create the local branch if it does not exist
        home branch --list "${local_branch}" |grep -q "${local_branch}" ||
            home branch "${target_branch}"
    else
        target_branch="main"
    fi

    echo "switching to branch '${target_branch}'"
    home checkout "${target_branch}"
}
