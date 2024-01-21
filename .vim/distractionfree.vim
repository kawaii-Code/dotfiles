" credits: https://zserge.com/posts/vim-distraction-free/

let dfm_width = 80
let dfm_height = 0.8
let width = dfm_width > 1 ? dfm_width : (winwidth('%') * dfm_width)

let margins = {
    \ "l": ("silent leftabove " . float2nr((winwidth('%') - width) / 2 - 1) . " vsplit new"),
    \ "h": ("silent rightbelow " . float2nr((winwidth('%') - width) / 2 - 1) . " vsplit new"),
    \ "j": ("silent leftabove " . float2nr(winheight('%') * (1 - dfm_height) / 2 - 1) . " split new"),
    \ "k": ("silent rightbelow " . float2nr(winheight('%') * (1 - dfm_height) / 2 - 1) . " split new"),
    \ }

set nonumber
set norelativenumber

for key in keys(margins)
    execute margins[key] . " | wincmd " . key
endfor
for key in ['NonText', 'Whitespace', 'VertSplit', 'StatusLine', 'StatusLineNC', 'EndOfBuffer']
    execute 'hi! ' . key . ' guifg=bg guibg=bg ctermfg=bg ctermbg=bg cterm=NONE'
endfor

set spell
set wrap | set linebreak

map E     :E<CR>
map q     :qa<CR>
map Q     :wqa<CR>
map <C-q> :qa!<CR>
map j gj
map k gk
