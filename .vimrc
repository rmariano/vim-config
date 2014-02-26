"" Vim configurations
set t_Co=256  "" Vim & terminal Mode in 256-colors
syntax on
colorscheme tromso
set number
"" highlight and do incremental search
set hlsearch
set incsearch
"" show all menu options
set wildmenu
"" New escaping sequence, double-tab for returning to normal mode
imap <Tab><Tab> <Esc>

"" \t handled properly
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set autoindent
set smartindent

"" Enable W for saving as an alias
command! W w

filetype plugin indent on

"" set <leader> as -
let mapleader="-"
let maplocalleader="-"

set wrap
set cursorline
set wildignore=*.pyc

"" look for trailing white spaces (tw)
nnoremap <leader>tw /\s\+$<cr>

set textwidth=79
"" autocmd`s for python only
augroup filetype_python
    autocmd!
    "" Shortcut for commenting out lines in python files
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    "" Remove trailing white spaces on saving *.py files
    autocmd BufWritePre *.py :%s/\s\+$//e
augroup END

"" Custom status bar
set laststatus=2  ""Always display the status bar


"" Shortcut for stop the highlighting after a search
"" and at the same time disable '.' for repeating the last command
nnoremap . :nohlsearch<cr>

"" Custom mappings for quick-fix window
nnoremap <leader>n :cnext<cr>
nnoremap <leader>b :cprevious<cr>
nnoremap <leader>q :cclose<cr>

"" Mark the limit of <text-width>
nnoremap <leader>j :call SetPageLimit()<cr>

function! SetPageLimit()
    if &colorcolumn
        let &colorcolumn=0
        return 0
    else
        let s:margin=join(range(&textwidth+1, &columns+1), ",")
        let &colorcolumn=s:margin
        return 1
    endif
endfunction

call SetPageLimit()  " Enabled by default

nnoremap <leader>p :set paste!<cr>

function! SetCustomStatusLine(alert_msg)
    set statusline=""
    set statusline+=%.30F%M  ""Full path of the file (up to 30c),<modif flag>
    set statusline+=%=  ""Switch to the right side
    set statusline+=Type:%y ""File Type
    set statusline+=\ [Col:%c\ Line:%l/%L\(%p%%\)] ""<col> <line>/<tot>(%)
endfunction

call SetCustomStatusLine("")
