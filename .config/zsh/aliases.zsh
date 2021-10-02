# Aliases for managing dotfiles repo
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

# Aliases for often used ls flags
alias l="/bin/ls -AF --group-directories-first --color=auto"
alias l1="/bin/ls -AF1 --group-directories-first --color=auto"
alias ll="/bin/ls -Alh --group-directories-first --color=auto"

# Decide on colorizing output automatically, exclude vcs directories
alias grep="grep --color=auto --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias fgrep="fgrep --color=auto --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias egrep="egrep --color=auto --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"

# Provided through dpkg-alternatives on Debian and derivatives
alias view="/usr/bin/vim -R"

# List hidden files, exclude vcs direcoties
alias tree="tree -a -I .git -I .hg -I .svn"
