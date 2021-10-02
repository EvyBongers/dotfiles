alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git"

alias ha='home add'
alias hc='home commit -v'
alias hc!='home commit -v --amend'
alias hca='home commit -v --all'
alias hcp='home cherry-pick'
alias hd='home diff'
alias hl="home pull"
alias hlol="home log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias hm='home merge main'
alias hmc='home merge --continue'
alias hp='home push'
alias hpf='home push --force-with-lease'
alias hrb='home rebase'
alias hrbc='home rebase --continue'
alias hrbm='home rebase main'
alias hrs='home restore'
alias hsh='home show'
alias hst='home status'
alias hsw='home_switch'
