"" YAML configuration

"" Comment (c) / uncomment (u) lines
noremap  <leader>c :s/^/#/g<CR>:let @/ = ""<CR>
vnoremap <leader>c :s/^/#/g<CR>:let @/ = ""<CR>
noremap  <leader>u :s/^#//g<CR>:let @/ = ""<CR>
vnoremap <leader>u :s/^#//g<CR>:let @/ = ""<CR>

setlocal shiftwidth=2 tabstop=2
