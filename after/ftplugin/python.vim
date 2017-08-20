"" Settings for Python

"" Shortcut for commenting out lines in python files
nnoremap <buffer> <localleader>c I# <ESC>
"" Highlight everything
let g:python_highlight_all = 1

function! AutofixPy()
    echom "Correcting Python file"
    if executable("autopep8")
        execute ":silent %!autopep8 - 2> /dev/null"
    endif
    if executable("isort")
        execute ":silent %!isort - 2>/dev/null"
    endif
    call Flake8()
endfunction

map <F3> :call AutofixPy()<CR>
