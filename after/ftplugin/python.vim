"" Settings for Python

"" Shortcut for commenting out lines in python files
nnoremap <buffer> <localleader>c I# <ESC>

function! AutofixPy()
    echom "Correcting Python file"
    if executable("black")
        echom "Calling black"
        execute ":silent %!black -l79 - 2> /dev/null"
    elseif executable("autopep8")
        echom "Calling autopep8"
        execute ":silent %!autopep8 - 2> /dev/null"
    endif
    if executable("isort")
        execute ":silent %!isort - 2>/dev/null"
    endif
    call Flake8()
endfunction

map <F3> :call AutofixPy()<CR>
