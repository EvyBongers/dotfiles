" Based on https://gist.github.com/dkasak/6ae1c6bf0d771155f23b
let $XDG_CACHE_HOME = !empty($XDG_CACHE_HOME) ? $XDG_CACHE_HOME : "~/.cache"
let $XDG_CONFIG_HOME = !empty($XDG_CONFIG_HOME) ? $XDG_CONFIG_HOME : "~/.config"
let $XDG_DATA_HOME = !empty($XDG_DATA_HOME) ? $XDG_DATA_HOME : "~/.local/share"

let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

set backupdir=$XDG_CACHE_HOME/vim/backup,~/,/tmp
set directory=$XDG_CACHE_HOME/vim/swap,~/,/tmp
set packpath=$XDG_CONFIG_HOME/vim
set runtimepath=$XDG_CONFIG_HOME/vim,$VIM/vimfiles,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after,$VIM/vimfiles/after
set undodir=$XDG_CACHE_HOME/vim/undo,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
