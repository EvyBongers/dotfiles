set
      \ nowrap
      \ shiftwidth=4
      \ softtabstop=4

let b:ale_linters = ['mdl']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'prettier',
      \]
let g:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
