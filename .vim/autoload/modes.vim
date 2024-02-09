" A bunch of useful functionality that does not depend on the file type,
" but also cannot be put in global config.

" Use `q` to exit Vim, Q to save and exit, etc.
" Useful for extremely quick edits.
function! modes#quicksession()
    nnoremap <silent> E     :E<CR>
    nnoremap <silent> q     :qa<CR>
    nnoremap <silent> Q     :wqa<CR>
    nnoremap <silent> <C-q> :qa!<CR>
endfunction

function! modes#plaintext()
    call modes#quicksession()

    setlocal wrap
    setlocal textwidth=0
    setlocal colorcolumn=
    setlocal linebreak
    setlocal showbreak=>\ 

    setlocal noexpandtab
    setlocal shiftwidth=8
    setlocal tabstop=8

    " Undo by sentence chunks. When a bunch of text is typed,
    " `u` won't undo the text, but rather till the below characters.
    "
    " :h i_CTRL-G_u
    "
    " credits: https://github.com/wincent/wincent/blob/main/aspects/nvim/files/.config/nvim/lua/wincent/vim/plaintext.lua#L22
    inoremap <buffer> , ,<C-g>u
    inoremap <buffer> . .<C-g>u
    inoremap <buffer> ? ?<C-g>u
    inoremap <buffer> ! !<C-g>u
    inoremap <buffer> : :<C-g>u
    inoremap <buffer> ; ;<C-g>u

    noremap <buffer> j gj
    noremap <buffer> k gk
endfunction

function! modes#readonly()
    call modes#quicksession()

    setlocal readonly
    setlocal nomodifiable

    nnoremap d <C-d>
    nnoremap u <C-u>
endfunction

" Distraction free mode removes all the noise from vim
" like line numbers, and tilde end of buffer characters.
"
" It also puts the main buffer in the center of the
" screen by creating four splits around it.
"
" credits: https://zserge.com/posts/vim-distraction-free/
function! modes#distractionfree()
    call modes#quicksession()

    let width = winwidth('%') * 0.7
    let height = 0.8

    " Figure out the split sizes
    let margins = {
                \ "l": ("silent leftabove " . float2nr((winwidth('%') - width) / 2 - 1) . " vsplit new"),
                \ "h": ("silent rightbelow " . float2nr((winwidth('%') - width) / 2 - 1) . " vsplit new"),
                \ "j": ("silent leftabove " . float2nr(winheight('%') * (1 - height) / 2 - 1) . " split new"),
                \ "k": ("silent rightbelow " . float2nr(winheight('%') * (1 - height) / 2 - 1) . " split new"),
                \ }

    set noshowmode
    set nonumber
    set norelativenumber

    for key in keys(margins)
        execute margins[key] . " | wincmd " . key
    endfor

    " Remove highlighting for noisy elements
    for key in ['NonText', 'Whitespace', 'VertSplit', 'StatusLine', 'StatusLineNC', 'EndOfBuffer']
        execute 'hi! ' . key . ' guifg=bg guibg=bg ctermfg=bg ctermbg=bg cterm=NONE'
    endfor
endfunction
