" BASIC
set nocompatible
" Scroll activates 3 lines before reaching edge
set scrolloff=3

" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf.vim'

call plug#end()

set termguicolors
lua require'colorizer'.setup()

" source the configuration for the theme
source $HOME/.config/nvim/themes/onedark.vim
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

" OPTIONS
set encoding=utf-8
set number relativenumber
set tabstop=2 shiftwidth=2 expandtab    "Set the tab size and transform tabs to spaces
set mouse=a
set clipboard+=unnamedplus              "Set clipboard to system clipboard
set cursorline                          "Highlight cursor line
set updatetime=100

" Highlight whitespaces
set list
set listchars=""
set listchars+=tab:>-
set listchars+=trail:•
set listchars+=nbsp:•

set spelllang=en

set hlsearch
set incsearch
set ignorecase
set smartcase

" KEYBINDIGS
" inoremap jj <Esc>
let mapleader = ' '

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-p> :Files<CR>
map <C-o> :Buffers<CR>
map <C-g> :GFiles<CR>
map <C-f> :Rg 

filetype plugin on

" Fix non terminal start window sizing
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
