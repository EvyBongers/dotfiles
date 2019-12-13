#
# https://superuser.com/questions/497715/keep-tmux-title-from-fg-to-original-jobname
#

function preexec {
  local fg_title
  if [[ $* == fg* ]]; then
     if [[ $* == *%* ]]; then
        fg_title=($(jobs ${${(z)1}[2]}))
     else
        fg_title=($(jobs %%))
     fi
     title "${fg_title[5,-1]}"
  else
     title $*
  fi
}
