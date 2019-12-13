alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git"

alias l="/bin/ls -AF --group-directories-first --color=auto"
alias l1="/bin/ls -AF1 --group-directories-first --color=auto"
alias ll="/bin/ls -Alh --group-directories-first --color=auto"

alias grep="grep --color=auto --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias fgrep="fgrep --color=auto --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias egrep="egrep --color=auto --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"

alias view="/usr/bin/vim -R"

alias signal-desktop="/usr/bin/signal-desktop --use-tray-icon"
