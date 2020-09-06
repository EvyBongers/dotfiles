set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ noexpandtab
      \ nowrap
      \ number
      \ relativenumber
      \ shiftwidth=4
      \ softtabstop=4
      \ tabstop=4

let b:ale_linters = ['gofmt']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'gofmt',
      \   'goimports',
      \]
let g:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
