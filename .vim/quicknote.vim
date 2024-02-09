" Take a quick note and save it with an auto-generated
" file name based on the title.

call modes#distractionfree()
call modes#quicksession()
call modes#plaintext()

0r ~/.vim/notetemplate.txt

set ft=markdown
set spell

function! Save()
    let l:filename = "~/inb/" .. join(split(tolower(getline(1))[2:], ' '), '-') .. '.txt'
    execute 'write' l:filename
endfunction

map Q :call Save()<CR>:qa<CR>
