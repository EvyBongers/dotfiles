set
      \ nowrap
      \ shiftwidth=4
      \ softtabstop=4
      \ textwidth=0

let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \]
let b:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
