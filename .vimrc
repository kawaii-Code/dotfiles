set nocompatible
set belloff=all
set smarttab
set nrformats-=octal
set incsearch
set wildmenu
set formatoptions+=j
set autoread
filetype plugin indent on

set langmap=йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:\'"zZxXcCvVbBnNmM\\,<.>?''"]

set mouse=a
set termguicolors

set number
set relativenumber
set colorcolumn=80
set scrolloff=8
set nowrap

set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

let g:mapleader=' '
nnoremap < <<
nnoremap > >>

colorscheme zenesque

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()
