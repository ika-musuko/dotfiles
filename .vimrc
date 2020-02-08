set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,elm,html,javascript,python,rust"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'rhysd/clever-f.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" autosuggest
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Color
Plug 'joshdick/onedark.vim'

"" fcitx management
Plug 'lilydjwg/fcitx.vim'

"*****************************************************************************
"" language packages
"*****************************************************************************

" fish
Plug 'dag/vim-fish'

" c/c++
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" graphql
Plug 'jparise/vim-graphql'


" elm
Plug 'elmcast/elm-vim'
Plug 'ultrox/elm-ale-pretty'


"flutter
Plug 'thosakwe/vim-flutter'


" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
Plug 'jelera/vim-javascript-syntax'


" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" rust
" Vim racer
Plug 'racer-rust/vim-racer'

" Rust.vim
Plug 'rust-lang/rust.vim'


" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

"*****************************************************************************
call plug#end()
filetype plugin indent on    " required
"*****************************************************************************
"*****************************************************************************

"*****************************************************************************
" Plugin specific bindings and settings
"*****************************************************************************
" clever-f
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

" undotree
map <leader>u :UndotreeToggle<cr>

" ale
nnoremap <leader>ad :ALEDetail<cr>
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>agg :ALEFirst<cr>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>aN :ALEPreviousWrap<cr>

let g:ale_linters = {}
let g:ale_fixers = {}


" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :Rg<cr>

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


"*****************************************************************************
" language specific bindings
"*****************************************************************************

" c/c++
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
let g:ale_cpp_gcc_options = "-std=c++17"

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
augroup END


" python
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>pg"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" flutter
augroup dart
    au FileType dart nnoremap <leader>fa :FlutterRun<cr>
    au FileType dart nnoremap <leader>fq :FlutterQuit<cr>
    au FileType dart nnoremap <leader>fr :FlutterHotReload<cr>
    au FileType dart nnoremap <leader>fR :FlutterHotRestart<cr>
    au FileType dart nnoremap <leader>fD :FlutterVisualDebug<cr>
    au FileType dart nnoremap <leader>fe :FlutterEmulatorsLaunch Pixel<cr>
augroup END

" rust
:call extend(g:ale_linters, { 
    \"rust": ["rls","cargo"]})
:call extend(g:ale_fixers, { 
    \"rust": ["rustfmt"]})

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

augroup rust
    au FileType rust noremap <leader>rb :Cbuild<cr>i
    au FileType rust noremap <leader>rr :Crun<cr>i
    au FileType rust noremap <leader>rt :Ctest<cr>
    au FileType rust noremap <leader>rf :RustFmt<cr>

    au FileType rust noremap <leader>ri :! cargo install
    au FileType rust noremap <leader>ru :! cargo uninstall

    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gx <Plug>(rust-def-vertical)
    au FileType rust nmap gt <Plug>(rust-def-tab)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)
augroup END


" elm
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

augroup elm
    au FileType elm nnoremap <leader>ec :ElmMake<cr>
    au FileType elm nnoremap <leader>em :ElmMakeMain<cr>
    au FileType elm nnoremap <leader>et :ElmTest<cr>
    au FileType elm nnoremap <leader>er :ElmRepl<cr>
    au FileType elm nnoremap <leader>ee :ElmErrorDetail<cr>
    au FileType elm nnoremap <leader>ed :ElmShowDocs<cr>
    au FileType elm nnoremap <leader>eb :ElmBrowseDocs<cr>
    au FileType elm nnoremap <leader>ef :ElmFormat<cr>
    au FileType elm nnoremap <leader>ex :r !hex2rgb 
augroup END

" go
:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <F6> <Plug>(go-rename)

  au FileType go nmap <F5> <Plug>(go-run-split)
  au FileType go nmap <leader>rq <C-w><C-w>ZZ
  au FileType go nmap <F4>  <Plug>(go-test)
  "au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>gi <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>gdr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>gdr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>gb :!go build<cr>
augroup END

au BufReadPost,BufNewFile *.ex source ~/.vim/config/elixir.vim

"*****************************************************************************
" statusline
"*****************************************************************************
"フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" vim-airline
let g:airline_theme='behelit'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


"*****************************************************************************
" STANDARD VIMRC
"*****************************************************************************
filetype plugin indent on

"main settings
syntax enable
set showcmd         " see command as it's being typed
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch        " highlight searches
set encoding=utf8
set fileencodings=utf8
set autoindent
set tabstop=4
set shiftwidth=4

set expandtab
set ls=2            " always show status line
set number
set relativenumber
set clipboard+=unnamedplus
set ttimeoutlen=100 " less esc key lag
set background=dark

"vanilla custom commands
command! -nargs=1 Tab set expandtab ts=<args> sw=<args> ai " set custom tab with (ex, :Tab 2)
" force :W and :Q to act like lowercase counterparts
command! W :w 
command! Q :q

"keyboard commands            
map <leader>[ :set virtualedit=""<CR>
map <leader>] :set virtualedit+=all<CR>
map <F11> :noh<CR>
map <F8> :cprev<CR>
map <F9> :cnext<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" buffer related
map <leader>[ :bp<CR>
map <leader>] :bn<CR>
map <leader>q :bd<CR>
map <leader>l :ls<CR>
nnoremap <C-S> :wall<CR>
noremap <C-N> :Lex<CR>
noremap! <C-N> :Lex<CR>
noremap <leader>e :Ex<CR>
noremap! <leader>e :Ex<CR>
noremap <leader>s :Sex<CR>
noremap! <leader>s :Sex<CR>
noremap <leader><space> za
nnoremap <leader>g :e <cfile><cr>
nnoremap <leader>% :e %<cr>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Vmap for maintaining Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" easy resizing
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" remember last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"load/save splits on startup/exit
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent! loadview 

" normal split creation
set splitbelow
set splitright

let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" permanent undo
set undodir=~/.vimdid
set undofile

"*****************************************************************************
" visuals
"*****************************************************************************
colorscheme purify
hi Normal guibg=NONE ctermbg=NONE

" enable 256-color
set t_Co=256

" spellcheck color
hi SpellBad ctermfg=015 ctermbg=001 cterm=none guifg=#FFFFFF guibg=#FF0000 gui=none

