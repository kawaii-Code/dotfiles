set nocompatible
set belloff=all

set hlsearch
set ignorecase
set incsearch
set virtualedit=block

set wildmenu
set autoread
set ttyfast

set mouse=a
set timeout
set ttimeout
set timeoutlen=300
set termguicolors
set showcmd
set number
set relativenumber
set scrolloff=8
set nowrap
set list
set listchars=tab:󱦰\ ,trail:`
set backspace=indent,eol,start

set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
syntax on

set background=dark
colorscheme retrobox

let g:mapleader=' '
nnoremap < <<
nnoremap > >>
nnoremap <leader>h :nohl<CR>
