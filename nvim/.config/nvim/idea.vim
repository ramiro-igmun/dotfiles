" BASIC
set nocompatible
" Scroll activates 3 lines before reaching edge
set scrolloff=3

" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

set termguicolors

" OPTIONS
set encoding=utf-8
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
let mapleader = ' '

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <A-h> <C-w>H
map <A-j> <C-w>J
map <A-k> <C-w>K
map <A-l> <C-w>L

filetype plugin on
