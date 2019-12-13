set nocompatible                " required
filetype off                    " required

filetype plugin indent on       " required

if has('gui_running')
  set background=light          " started as gvim, so we'll have a light background
else
  set background=dark           " most likely run from console, so we'll have a dark background
endif
set autoindent                  " always set autoindenting on
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set colorcolumn=81              " indicate when going over 80 columns
set encoding=utf-8              " always use utf-8 encoding
set expandtab                   " expand tabs to spaces
set fileformat=unix             " use unix file format
set history=50                  " keep 50 lines of command line history
set incsearch                   " do incremental searching
set list                        " enable list mode to display differences between tabs and spaces
set listchars=tab:»˙,trail:•    " set the characters used to identify tabs and trailing spaces
set nonumber                    " don't show line numbers
set ruler                       " show the cursor position all the time
set shiftwidth=4                " shift 4 spaces for indentation
set showcmd                     " display incomplete commands
set softtabstop=4               " use 4 spaces for tab
set tabstop=8                   " place tabstop on 8 spaces, makes unexpanded tabs stand out
set wrap                        " wrap text

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  highlight TrailWhitespace ctermbg=red guibg=darkred
  highlight UnwantedTab ctermbg=red guibg=darkred

  autocmd BufNewFile,BufRead *.py,*.pyw,*.c,*.h match TrailWhitespace /\s\+$/
  autocmd BufNewFile,BufRead *.py,*.pyw,*.c,*.h match UnwantedTab /\t/

  autocmd FileType bzl          :so ~/.vim/bzl.vim
  autocmd FileType c            :so ~/.vim/c.vim
  autocmd FileType cpp          :so ~/.vim/cpp.vim
  autocmd FileType css          :so ~/.vim/css.vim
  autocmd FileType go           :so ~/.vim/go.vim
  autocmd FileType html         :so ~/.vim/html.vim
  autocmd FileType javascript   :so ~/.vim/js.vim
  autocmd FileType json         :so ~/.vim/json.vim
  autocmd FileType markdown     :so ~/.vim/md.vim
  autocmd FileType php          :so ~/.vim/php.vim
  autocmd FileType python       :so ~/.vim/python.vim
  autocmd FileType ruby         :so ~/.vim/ruby.vim
  autocmd FileType sh           :so ~/.vim/sh.vim
  autocmd FileType text         :so ~/.vim/txt.vim
  autocmd FileType yaml         :so ~/.vim/yaml.vim
endif

" Enable python syntax highlighting
let python_highlight_all=1
syntax on

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" Allow quick return-to-command-mode
imap kj <Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Hide .pyc and vim backup files
let NERDTreeIgnore=['\.pyc$', '\~$']
