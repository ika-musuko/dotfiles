" rust
let g:ale_linters = {'rust': ['rls','cargo']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_completion_enabled = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_fix_on_save = 1
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let g:autofmt_autosave = 1
set hidden
let g:racer_cmd = '/home/sherwyn/.cargo/bin/racer'
let g:racer_experimental_completer = 1

nnoremap <leader>rb :Cbuild<cr>i
nnoremap <leader>rr :Crun<cr>i
nnoremap <leader>rt :Ctest<cr>
nnoremap <leader>rf :RustFmt<cr>
nnoremap <leader>rrr :RustRun<cr>i

nnoremap <leader>ri :! cargo install
nnoremap <leader>ru :! cargo uninstall

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap gt <Plug>(rust-def-tab)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

