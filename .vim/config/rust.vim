" rust
let g:autofmt_autosave = 1

autocmd BufWritePre *.rs execute 'RustFmt'

nnoremap <leader>rb :Cbuild<cr>i
nnoremap <leader>rr :Crun<cr>i
nnoremap <leader>rt :Ctest<cr>
nnoremap <leader>rf :RustFmt<cr>
nnoremap <leader>rrr :RustRun<cr>i

nnoremap <leader>ri :! cargo install
nnoremap <leader>ru :! cargo uninstall

