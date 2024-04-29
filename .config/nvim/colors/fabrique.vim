" Fabrique Palette
"
" Background          #111111 (Term)
" White               #EBDBB2
" Yellow              #EBC06D
" Red                 #FB4444
" Green               #88BB66
" Dark Gray           #2A2A2A (#202020)
" Gray                #887766
" Light Gray          #AEAE9E

highlight! clear 

highlight! Normal     guibg=NONE guifg=#EBDBB2 ctermfg=0 ctermbg=0
highlight! Visual     guibg=fg   guifg=#2A2A2A

" Code
highlight! Comment    guibg=NONE guifg=#887766
highlight! Whitespace guibg=NONE guifg=#202020
highlight! Type       guibg=NONE guifg=#AEAE9E gui=bold
highlight! String     guibg=NONE guifg=#88BB66
highlight! Special    guibg=NONE guifg=#EBC06D
2025-10-31
highlight! Identifier guibg=NONE guifg=NONE
highlight! Statement  guibg=NONE guifg=#EBC06D
highlight! PreProc    guibg=NONE guifg=#AEAE9E
highlight! Constant   guibg=NONE guifg=fg
highlight! Operator   guibg=NONE guifg=#AEAE9E
highlight! Todo       guibg=NONE guifg=fg      gui=bold cterm=bold term=standout
highlight! link Function Statement

" Vim
highlight! Pmenu      guibg=#2A2A2A guifg=fg ctermbg=bg  ctermfg=fg
highlight! PmenuSel   guibg=fg      guifg=#2A2A2A ctermbg=fg  ctermfg=bg
highlight! WildMenu   guibg=#2A2A2A guifg=fg ctermbg=232 ctermfg=159
highlight! link PmenuSbar PmenuSel

highlight! Search    guibg=#AEAE9E guifg=#2A2A2A ctermbg=0   ctermfg=0
highlight! IncSearch guibg=bg      guifg=#EBC06D ctermbg=0   ctermfg=0
highlight! link MatchParen Todo

highlight! CursorLine   guibg=#AEAE9E guifg=#2A2A2A
highlight! LineNr       guibg=NONE    guifg=#887766
highlight! VertSplit    guibg=#2A2A2A guifg=#303030
highlight! StatusLine   guibg=#2A2A2A guifg=fg      gui=NONE
highlight! StatusLineNC guibg=#2A2A2A guifg=#AEAE9E gui=NONE
highlight! ColorColumn  guibg=#2A2A2A guifg=#AEAE9E gui=NONE
highlight! Folded       guibg=#2A2A2A guifg=#887766
highlight! link FoldColumn Folded
highlight! link CursorLineNr LineNr

highlight! link SignColumn  LineNr
highlight! link NonText     Whitespace
highlight! link Conceal     Whitespace
highlight! link EndOfBuffer Whitespace
highlight! link Title       IncSearch

highlight! Directory guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
highlight! link Question String

" Retrobox
highlight! SpecialKey guifg=#2A2A2A
highlight! Error      guifg=#2A2A2A guibg=#FB4444
highlight! link ErrorMsg Error

let g:colors_name = "fabrique"
