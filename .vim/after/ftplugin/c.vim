" Options and mappings for editing C/C++ code.

" No max line length
setlocal nowrap
setlocal textwidth=0
setlocal colorcolumn=80

" Formatting options: fix the horrendous switch treatment and
" indent after `public:` in C++ code + some other nice options.
"
" :h cinoptions-values
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
