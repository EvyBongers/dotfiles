set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ nowrap
      \ shiftwidth=2
      \ softtabstop=2

let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'terraform',
      \]
let b:ale_fix_on_save = 1
let b:ale_linters = ['terraform']

let g:terraform_fmt_on_save = 1
