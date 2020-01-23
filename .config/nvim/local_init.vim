""""" PLUGIN SPECIFIC VIMRC """""
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

" go
au FileType go nmap <leader>gdb :GoDebugStart<cr>
au FileType go nmap <leader>gds :GoDebugStop<cr>
au FileType go nmap <leader>ge :GoErrCheck<cr>

""""" STANDARD VIMRC """""
" Source a global configuration file if available

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
autocmd WinEnter,FocusGained,BufReadPre,FileReadPre * :setlocal number relativenumber
autocmd WinLeave,FocusLost                          * :setlocal number norelativenumber
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

"easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"load/save splits on startup/exit
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent! loadview 

"normal split creation
set splitbelow
set splitright

"show spaces
"set list
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"hi specialkey ctermfg=66 guifg=#222222

"permanent undo
set undodir=~/.vimdid
set undofile

"enable 256-color
set t_Co=256

" spellcheck color
hi SpellBad ctermfg=015 ctermbg=001 cterm=none guifg=#FFFFFF guibg=#FF0000 gui=none

"indenting by 2 for some languages
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype crystal setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype nim setlocal ts=2 sw=2 expandtab
autocmd Filetype dart setlocal ts=2 sw=2 expandtab

"フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"colors
"set termguicolors
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1

"c++
let g:ale_cpp_gcc_options = "-std=c++17"
