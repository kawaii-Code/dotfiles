" noremap <F2> :call RenameWord()<CR>

" Renames word under cursor with confirmation in the current file
" TODO Rename all matches from files in index.txt too.
function utils#renameword()
    let input = expand("<cword>")
    if input !=# ''
        call inputsave()
        let replacement = input("Replace " . input . " with: ", input)
        call inputrestore()

        if replacement !=# ''
            execute "%s/\\<" . input . "\\>/" . replacement . "/c"
        endif
    endif
endfunction

let s:lighttheme = 0
function utils#togglelighttheme()
    if s:lighttheme == 0
        let s:lighttheme = 1
        set background=light
        colorscheme peachpuff
    else
        let s:lighttheme = 0
        set background=dark
        colorscheme retrobox
    endif
endfunction
