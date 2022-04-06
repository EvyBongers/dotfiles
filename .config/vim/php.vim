set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ nowrap
      \ number
      \ relativenumber

let b:ale_linters = ['phpcs']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'php_cs_fixer',
      \]
let b:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
