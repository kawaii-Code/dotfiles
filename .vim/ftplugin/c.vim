" Options and mappings for editing C/C++ code.
"
" For full power, requires a file `index.txt` at the directory
" root that contains paths to the project's files. It will be used
" for telescope-like file switching.
"
" index.txt can be generated with something like this:
" `find -name '*.c' -or -name '*.h' > index.txt`
"

" No max line length
setlocal nowrap
setlocal textwidth=0

" Formatting options: fix the horrendous switch treatment and
" indent after `public:` in C++ code + some other nice options.
setlocal cindent
setlocal cinoptions=:0,l1,g0,N-s,E-s,(0

" Quick selection
" 1. Select all function (linewise)
nnoremap <leader>sf ][V%
" 2. Select inside function (linewise)
nnoremap <leader>si ][vi{V

" Quickfix mode
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
nnoremap <leader>cq :cclose<CR>

" Index file, telescope-like file search
nnoremap <leader>f :edit index.txt<CR>/
augroup IndexFile
    autocmd!
    autocmd BufRead index.txt cnoremap <buffer> <CR> <CR>:keepjumps normal gF<CR>
    autocmd BufRead index.txt nnoremap <buffer> <CR>     :keepjumps normal gF<CR>
augroup END

" Search for word under cursor in files from index.txt
noremap <F3> :execute "vimgrep /\\<<C-r><C-w>\\>/ " . join(readfile("index.txt"))<CR>:copen<CR>
