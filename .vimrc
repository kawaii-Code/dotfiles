" Options that fit any type of file.
" There is more configuration in ~/.vim

set nocompatible
set belloff=all
set wildmenu
set autoread
set ttyfast

" Sensible search options
set hlsearch
set ignorecase
set incsearch

set number
set relativenumber

set hidden
set mouse=a
set showcmd
set virtualedit=block
set backspace=indent,eol,start
set termguicolors
set scrolloff=8
set nowrap

" I made that myself... That was long...
set langmap=ю.,б\\,,ж\\;,ьm,тn,иb,мv,сc,чx,яz,э',дl,лk,оj,рh,пg,аf,вd,ыs,фa,ъ],х[,зp,щo,шi,гu,нy,еt,кr,уe,цw,йq,ё`,Ю>,Б<,ЬM,ТN,ИB,МV,СC,ЧX,ЯZ,Э\\",Ж:,ДL,ЛK,ОJ,РH,ПG,АF,ВD,ЫS,ФA,Ъ},Х{,ЗP,ЩO,ШI,ГU,НY,ЕT,КR,УE,ЦW,Й~,ЁQ

" Show different hidden characters
set list
set listchars=tab:»\ ,trail:`
set showbreak=>\ 

set tabstop=4
set shiftwidth=4
set expandtab

" Vim can get stuck sometimes waiting for a key combination.
" E.g., when I quickly pressed <ESC>O, it took a while for the
" new line to appear. That's because of the `timeout` option.
" Vim waits a little after input to see whether I'll type a key
" combination.
"
" If there will be no timeout however, mappings like <leader>sf
" won't be possible to type quickly enough.
"
" fix:
" Don't wait for standard keys (`ttimeoutlen=50`)
" But wait for custom mappings (`timeoutlen=500`)
set timeout
set ttimeout
set timeoutlen=500
set ttimeoutlen=50

filetype plugin indent on
syntax on

" The best colorscheme ever <3
set background=dark
colorscheme retrobox

" Repeat macro in 'q' register
"
" Remapping <CR> causes some issues
" fix: https://stackoverflow.com/a/16360104
nnoremap <CR> @q
autocmd CmdwinEnter *        nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Move across paragraphs with J and K
noremap J }
noremap K {

" Remap docs to F1, since K was taken
nnoremap <F1> K

" Quick buffer switching
noremap <leader>1 :b1<CR>
noremap <leader>2 :b2<CR>
noremap <leader>3 :b3<CR>
noremap <leader>4 :b4<CR>
noremap <leader>5 :b5<CR>
noremap <leader>6 :b6<CR>
noremap <leader>7 :b7<CR>
noremap <leader>8 :b8<CR>
noremap <leader>9 :b9<CR>

" Emacs bindings for cmdline.
execute "set <M-f>=\ef"
execute "set <M-b>=\eb"
cnoremap <M-f> <C-Right>
cnoremap <M-b> <C-Left>
cnoremap <C-d> <Delete>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

let g:mapleader=' '
nnoremap < <<
nnoremap > >>
nnoremap <leader>h :nohl<CR>
