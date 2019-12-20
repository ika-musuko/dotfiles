" ale
nnoremap <leader>ad :ALEDetail<cr>
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>agg :ALEFirst<cr>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>aN :ALEPreviousWrap<cr>

let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\}

let g:ale_fixers = {
\   'elixir': ['mix_format'],
\}

let g:ale_elixir_elixir_ls_release='/usr/bin/elixir-ls'
