set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ nowrap
      \ shiftwidth=2
      \ softtabstop=2

let b:ale_linters = ['csslint']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'prettier',
      \]
let g:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
