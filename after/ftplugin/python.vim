"" Settings for Python

"" Comment / uncomment files
noremap  <leader>c :s/^/#/g<CR>:let @/ = ""<CR>
vnoremap <leader>c :s/^/#/g<CR>:let @/ = ""<CR>
noremap  <leader>u :s/^#//g<CR>:let @/ = ""<CR>
vnoremap <leader>u :s/^#//g<CR>:let @/ = ""<CR>

"" Adjust file
function! AutofixPy()
    echom "Formatting Python file"
    execute ":silent %!python3 -m ruff format - 2> /dev/null"
endfunction

map <F3> :call AutofixPy()<CR>
"" Do not automatically wrap code to the max length
setlocal nowrap
