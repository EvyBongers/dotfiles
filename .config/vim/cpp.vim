set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=indent
      \ nowrap
      \ number
      \ relativenumber
      \ splitbelow
      \ splitright
      \ shiftwidth=2
      \ softtabstop=2
      \ tabstop=2

let b:ale_linters = ['clang']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'clang-format',
      \]
let g:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
