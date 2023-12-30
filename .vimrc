set nocompatible
set belloff=all
set smarttab
set nrformats-=octal

set hlsearch
set ignorecase
set incsearch
set virtualedit=block

set wildmenu
set autoread
set ttyfast

set timeout timeoutlen=5000 ttimeoutlen=100

set mouse=a
set termguicolors
set showcmd
set lazyredraw
set number
set relativenumber
set scrolloff=8
set nowrap
set list
set listchars=tab:>\ ,trail:`
set backspace=indent,eol,start

filetype plugin indent on
syntax on

set background=dark
colorscheme retrobox

let g:mapleader=' '
nnoremap < <<
nnoremap > >>
nnoremap <leader>h :nohl<CR>

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-pencil'
call plug#end()

function! Text()
	Goyo 81
	nnoremap q :qa<CR>
	nnoremap Q :qa!<CR>
endfunction

augroup Writing
  autocmd FileType text call Text()
augroup END
