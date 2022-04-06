set
      \ foldlevel=99
      \ foldlevelstart=1
      \ foldmethod=syntax
      \ nowrap

let b:ale_linters = ['shellcheck']
let b:ale_fixers = [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'shfmt',
      \]
let b:ale_fix_on_save = 1

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
