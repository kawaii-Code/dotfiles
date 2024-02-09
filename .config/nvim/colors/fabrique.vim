highlight! clear 

highlight! Normal guibg=#111111 guifg=#EBDBB2 ctermbg=0 ctermfg=0
highlight! Visual guibg=fg      guifg=bg      ctermbg=0   ctermfg=0

" Code
highlight! Comment    guibg=NONE    guifg=#928374 ctermbg=bg  ctermfg=236
highlight! Whitespace guibg=NONE    guifg=#282828 ctermbg=bg  ctermfg=fg
highlight! Type       guibg=NONE    guifg=#AEAE9E ctermbg=bg  ctermfg=fg
highlight! String     guibg=NONE    guifg=#98BB6C ctermfg=180 ctermbg=NONE

highlight! Identifier guibg=NONE    guifg=NONE    ctermfg=180 ctermbg=NONE
highlight! Statement  guibg=NONE    guifg=#EBC06D ctermbg=bg  ctermfg=fg
highlight! PreProc    guibg=NONE    guifg=#AEAE9E ctermbg=bg  ctermfg=fg
highlight! Constant   guibg=NONE    guifg=NONE    ctermfg=233 ctermbg=bg
highlight! Operator   guibg=NONE    guifg=#AEAE9E ctermfg=180 ctermbg=NONE
highlight! Todo       guibg=bg      guifg=fg      ctermfg=fg  ctermbg=bg gui=bold cterm=bold term=standout
highlight! link Function Statement

" Vim
highlight! Pmenu    guibg=#282828 guifg=fg ctermbg=bg  ctermfg=fg
highlight! PmenuSel guibg=fg      guifg=bg ctermbg=fg  ctermfg=bg
highlight! WildMenu guibg=#282828 guifg=fg ctermbg=232 ctermfg=159
highlight! link PmenuSbar PmenuSel

highlight! Search    guibg=#A0A8A0 guifg=bg      ctermbg=0   ctermfg=0
highlight! IncSearch guibg=bg      guifg=#DDA0A0 ctermbg=0   ctermfg=0
highlight! link MatchParen Todo

highlight! CursorLine   guibg=#A8A8A0 guifg=bg               ctermbg=230 ctermfg=fg
highlight! LineNr       guibg=bg      guifg=#505050          ctermbg=bg  ctermfg=239
highlight! VertSplit    guibg=#282828 guifg=#282828          ctermbg=159 ctermfg=232
highlight! StatusLine   guibg=#282828 guifg=fg      gui=NONE ctermbg=235 ctermfg=232
highlight! StatusLineNC guibg=#282828 guifg=#AEAE9E gui=NONE ctermbg=194 ctermfg=232
highlight! ColorColumn  guibg=#282828 guifg=#AEAE9E gui=NONE ctermbg=194 ctermfg=232
highlight! link SignColumn LineNr

highlight! link NonText Whitespace
highlight! link Conceal Whitespace
highlight! link EndOfBuffer Whitespace

highlight! link Title IncSearch
highlight! Directory guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE

" Retrobox
highlight! SpecialKey guifg=#928374
highlight! Error      guifg=#1c1c1c guibg=#fb4934

highlight! link ErrorMsg Error

let g:colors_name = "fabrique"
