" BASIC
set nocompatible

" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim'

call plug#end()

" source the configuration for the theme
source $HOME/.config/nvim/themes/onedark.vim

" OPTIONS 
set encoding=utf-8
set number relativenumber
set tabstop=2 shiftwidth=2 expandtab
set mouse=a
set clipboard+=unnamedplus
set cursorline" Highlight whitespaces
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
inoremap jj <Esc>
let mapleader = ' '

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

filetype plugin on

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
