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
        echom printf("Formatting with black (margin at %d columns)", &textwidth)
        execute printf(":silent %%!black -l %d - 2> /dev/null", &textwidth)
    elseif executable("autopep8")
        echom "Calling autopep8"
        execute ":silent %!autopep8 - 2> /dev/null"
    endif
    call Flake8()
endfunction

map <F3> :call AutofixPy()<CR>
