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
