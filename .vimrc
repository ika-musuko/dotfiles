set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'rhysd/clever-f.vim'
Plugin 'vim-scripts/DrawIt'
Plugin 'zah/nim.vim'
Plugin 'jparise/vim-graphql'
Plugin 'tpope/vim-surround'
Plugin 'thosakwe/vim-flutter'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'ncm2/ncm2'
Plugin 'ElmCast/elm-vim'
Plugin 'dense-analysis/ale'
Plugin 'fatih/vim-go'
Plugin 'jdsimcoe/panic.vim'
Plugin 'sickill/vim-monokai'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'sjl/badwolf'
Plugin 'elixir-editors/vim-elixir'
Plugin 'embear/vim-localvimrc'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'racer-rust/vim-racer'
Plugin 'dag/vim-fish'
Plugin 'mbbill/undotree'
Plugin 'ultrox/elm-ale-pretty'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""" PLUGIN SPECIFIC VIMRC """""
" clever-f
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

" undotree
map <leader>u :UndotreeToggle<cr>

source ~/.vim/config/ale.vim
source ~/.vim/config/fzf.vim
source ~/.vim/config/lsp.vim
au BufReadPost,BufNewFile *.dart source ~/.vim/config/flutter.vim
au BufReadPost,BufNewFile *.rs source ~/.vim/config/rust.vim
au BufReadPost,BufNewFile *.elm source ~/.vim/config/elm.vim
au BufReadPost,BufNewFile *.go source ~/.vim/config/go.vim
au BufReadPost,BufNewFile *.ex source ~/.vim/config/elixir.vim
au BufReadPost,BufNewFile *.hs source ~/.vim/config/haskell.vim

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
colorscheme monokai
"let g:airline_theme='base16_isotope'
let g:airline#extensions#tabline#enabled = 1

"c++
let g:ale_cpp_gcc_options = "-std=c++17"
