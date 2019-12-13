set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ nowrap
      \ number
      \ relativenumber
      \ splitbelow
      \ splitright

let b:ale_linters = ['rufo']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'rufo',
      \]
let g:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
