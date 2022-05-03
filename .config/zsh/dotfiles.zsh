function home() {
    git --work-tree=${HOME} \
        --git-dir=${HOME}/.files.git \
        "${@}"
}
compdef -e "words[1]=(git --work-tree=${HOME} --git-dir=${HOME}/.files.git); service=git; (( CURRENT+=2 )); _git" home

function home_current_branch() {
    declare -a cmds=(
        "home branch --show-current"
        "home symbolic-ref --quiet HEAD |sed 's@^refs/heads/@@'"
    )
    for cmd in "${cmds[@]}"; do
        eval "${cmd}" 2>/dev/null && return
    done
}

function home_switch() {
    local current_branch local_branch target_branch

    declare -r current_branch="$(home_current_branch)"
    declare -r local_branch="${1:-$SHORT_HOST}"

    if [[ -z "${current_branch:-}" ]]; then
        echo "Currently in detached head" >&2
        return 1
    elif [[ -z "${local_branch:-}" ]]; then
        echo "Failed to determine local branch" >&2
        return 1
    elif [[ "${current_branch}" != "${local_branch}" ]]; then
        target_branch="${local_branch}"
    else
        target_branch="main"
    fi

    echo "switching to branch '${target_branch}'"
    home show-ref --quiet "refs/heads/${target_branch}" ||
        home branch "${target_branch}"
    home switch "${target_branch}"
}

#
# Aliases
# (sorted alphabetically)
#

alias h='home'
alias ha='home add'
alias hb='home branch'
alias hba='home branch -a'
alias hbd='home branch -d'
alias hc='home commit -v'
alias hc!='home commit -v --amend'
alias hca='home commit -v --all'
alias hcp='home cherry-pick'
alias hd='home diff'
alias hfa='home fetch --all --prune --jobs=10'
alias hl='home pull'
alias hlol="home log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias hm='home merge main'
alias hmc='home merge --continue'
alias hp='home push'
alias hpf='home push --force-with-lease'
alias hrb='home rebase'
alias hrbc='home rebase --continue'
alias hrbm='home rebase main'
alias hrm='home rm'
alias hrs='home restore'
alias hsh='home show'
alias hst='home status'
alias hsw='home_switch'
