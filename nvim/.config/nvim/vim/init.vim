" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

Plug 'navarasu/onedark.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" source the configuration for the theme
" source $HOME/.config/nvim/themes/onedark.vim
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

" Netrw settings
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'

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
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fr :Rg<space><CR>
nmap <leader>h gT<CR>
nmap <leader>l gt<CR>
nmap <leader>cl <C-w>c

filetype plugin on

" Fix non terminal start window sizing
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
