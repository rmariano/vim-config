"" Vim configurations
syntax on
colorscheme darkblue
set number
"" highlight and do incremental search
set hlsearch
set incsearch
"" show all menu options
set wildmenu
"" New escaping sequence, double-tab for returning to normal mode
imap <Tab><Tab> <Esc>

"" \t handled correctly
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set autoindent

"" Enable W for saving as an alias
command! W w

filetype plugin indent on

"" set <leader> as -
let mapleader="-"
let maplocalleader="-"

set wrap

"" cancel the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"" look for trailing whitespaces (tw)
nnoremap <leader>tw /\s\+$<cr>

"" autocmd`s for python only
augroup filetype_python
    autocmd!
    "" Shortcut for commenting out lines in python files
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    "" Remove trailing whitespaces on save
    autocmd BufWritePre *.py :%s/\s\+$//e
    set textwidth=79
augroup END

"" Custom status bar
set laststatus=2  ""Always display the status bar
set statusline=%.30F%M  ""Full path of the file (up to 30c),<modif flag>
set statusline+=%=  ""Switch to the right side
set statusline+=Type:%y ""File Type
set statusline+=\ [Col:%c\ Line:%l/%L\(%p%%\)] ""<col> <currline>/<totlines>(%)

"" Color the statusline
highlight StatusLine ctermbg=darkblue ctermfg=white cterm=bold

"" Shortcut for stop the highlighting after a search
"" and at the same time disable '.' for repeating the last command
nnoremap . :nohlsearch<cr>

"" Custom grep filter map
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>
