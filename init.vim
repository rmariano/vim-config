set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

highlight LineNr ctermfg=243 guifg=#c8c8c8 gui=bold
highlight CursorLineNr ctermfg=15 guifg=#ffcc00 gui=bold
