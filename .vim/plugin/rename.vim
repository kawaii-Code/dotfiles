noremap <F2> :call RenameWord()<CR>

" Renames word under cursor with confirmation in the current file
" TODO Rename all matches from files in index.txt too.
function RenameWord()
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
