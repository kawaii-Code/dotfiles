highlight clear 

highlight! Normal guibg=#141617 guifg=#ECE1D7 ctermbg=232 ctermfg=232 
highlight! Visual guibg=fg      guifg=bg      ctermbg=0   ctermfg=0

" Code
highlight! Comment    guibg=NONE    guifg=#928374 ctermbg=bg  ctermfg=236
highlight! Whitespace guibg=NONE    guifg=#282828 ctermbg=bg  ctermfg=fg
highlight! Type       guibg=NONE    guifg=#AEAE9E ctermbg=bg  ctermfg=fg
highlight! String     guibg=NONE    guifg=#B8BB26 ctermfg=180 ctermbg=NONE
highlight! Identifier guibg=NONE    guifg=NONE    ctermfg=180 ctermbg=NONE
highlight! Statement  guibg=NONE    guifg=#EBC06D ctermbg=bg  ctermfg=fg
highlight! PreProc    guibg=NONE    guifg=#AEAE9E ctermbg=bg  ctermfg=fg
highlight! Constant   guibg=NONE    guifg=NONE    ctermfg=233 ctermbg=bg 
highlight! Operator   guibg=NONE    guifg=#AEAE9E ctermfg=180 ctermbg=NONE
highlight! Todo       guibg=#505050 guifg=fg      ctermfg=180 ctermbg=NONE
highlight! link Function Statement

" Vim
highlight! Pmenu    guibg=#282828 guifg=fg ctermbg=bg  ctermfg=fg
highlight! PmenuSel guibg=fg      guifg=bg ctermbg=fg  ctermfg=bg
highlight! WildMenu guibg=#282828 guifg=fg ctermbg=232 ctermfg=159
highlight! link PmenuSbar PmenuSel

highlight! CursorLine   guibg=fg      guifg=bg               ctermbg=230 ctermfg=fg
highlight! LineNr       guibg=bg      guifg=#505050          ctermbg=bg  ctermfg=239
highlight! VertSplit    guibg=#282828 guifg=#282828          ctermbg=159 ctermfg=232
highlight! StatusLine   guibg=#282828 guifg=fg      gui=NONE ctermbg=235 ctermfg=232
highlight! StatusLineNC guibg=#282828 guifg=#AEAE9E gui=NONE ctermbg=194 ctermfg=232
highlight! ColorColumn  guibg=#282828 guifg=#AEAE9E gui=NONE ctermbg=194 ctermfg=232
highlight! link         SignColumn LineNr

highlight! link NonText Whitespace
highlight! link Conceal Whitespace

highlight! Directory guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE

let g:colors_name = "kawaii"
