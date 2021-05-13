let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

set backupdir=$XDG_CACHE_HOME/vim/backup,~/,/tmp
set directory=$XDG_CACHE_HOME/vim/swap,~/,/tmp
set packpath=$XDG_CONFIG_HOME/vim
set runtimepath=$XDG_CONFIG_HOME/vim,$VIM/vimfiles,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after,$VIM/vimfiles/after
set undodir=$XDG_CACHE_HOME/vim/undo,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
