set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=indent
      \ nowrap
      \ number
      \ relativenumber

let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \]
let g:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>

