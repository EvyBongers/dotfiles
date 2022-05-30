let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

set backupdir=$XDG_CACHE_HOME/vim/backup,~/,/tmp
set directory=$XDG_CACHE_HOME/vim/swap,~/,/tmp
set undodir=$XDG_CACHE_HOME/vim/undo,~/,/tmp

set packpath=$XDG_CONFIG_HOME/vim
set runtimepath=$XDG_CONFIG_HOME/vim,$VIM/vimfiles,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after,$VIM/vimfiles/after
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

" Create directories if they doesn't exist
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif
