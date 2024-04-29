" Emacs bindings for cmdline.
if has('nvim')
    cnoremap <A-f> <C-Right>
    cnoremap <A-b> <C-Left>
else
    " Can break on some terminals
    execute "set <M-f>=\ef"
    execute "set <M-b>=\eb"
    cnoremap <M-f> <C-Right>
    cnoremap <M-b> <C-Left>
end

cnoremap <C-d> <Delete>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
