"elm
let g:elm_setup_keybindings = 0

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

nnoremap <leader>ec :ElmMake<cr>
nnoremap <leader>em :ElmMakeMain<cr>
nnoremap <leader>et :ElmTest<cr>
nnoremap <leader>er :ElmRepl<cr>
nnoremap <leader>ee :ElmErrorDetail<cr>
nnoremap <leader>ed :ElmShowDocs<cr>
nnoremap <leader>eb :ElmBrowseDocs<cr>
nnoremap <leader>ef :ElmFormat<cr>
