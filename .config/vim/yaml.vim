set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ nowrap
      \ shiftwidth=2
      \ softtabstop=2
      \ tabstop=2

let b:ale_linters = ['yamllint']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \]
let b:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
