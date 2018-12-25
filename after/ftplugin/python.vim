"" Settings for Python

"" Comment / uncomment files
noremap  <leader>c :s/^/#/g<CR>:let @/ = ""<CR>
vnoremap <leader>c :s/^/#/g<CR>:let @/ = ""<CR>
noremap  <leader>u :s/^#//g<CR>:let @/ = ""<CR>
vnoremap <leader>u :s/^#//g<CR>:let @/ = ""<CR>

"" Adjust file
function! AutofixPy()
    echom "Correcting Python file"
    if executable("isort")
        echom "Sorting imports"
        execute ":silent %!isort - 2>/dev/null"
    endif
    if executable("black")
        echom "Calling black"
        execute ":silent %!black -l79 - 2> /dev/null"
    elseif executable("autopep8")
        echom "Calling autopep8"
        execute ":silent %!autopep8 - 2> /dev/null"
    endif
    call Flake8()
endfunction

map <F3> :call AutofixPy()<CR>
