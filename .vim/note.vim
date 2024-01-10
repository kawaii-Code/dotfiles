source ~/.vim/distractionfree.vim

0r ~/.vim/notetemplate.txt

set ft=markdown
set spell

function! Save()
    let l:filename = "~/inb/" .. join(split(tolower(getline(1))[2:], ' '), '-') .. '.txt'
    execute 'write' l:filename
endfunction

map Q :call Save()<CR>:qa<CR>
