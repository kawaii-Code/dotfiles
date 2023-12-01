set nocompatible
set belloff=all
set smarttab
set nrformats-=octal
set incsearch
set wildmenu
set formatoptions+=j
set autoread
filetype plugin indent on

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set timeout timeoutlen=5000 ttimeoutlen=100

set mouse=a
set termguicolors

set hlsearch
set incsearch
set ignorecase

set showcmd
set lazyredraw
set number
set relativenumber
set colorcolumn=80
set scrolloff=8
set nowrap
set list
set listchars=tab:>\ ,trail:`
set backspace=indent,eol,start

set background=dark
colorscheme retrobox

let g:mapleader=' '
nnoremap < <<
nnoremap > >>
nnoremap <leader>h :nohl<CR>
