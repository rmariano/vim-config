"" Vim configurations
" Maintainer: Mariano Anaya
" Last Change:
" Created: 01 Jan 2014
""""""""""""""""""""""""""""""

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
inoremap <Tab><Tab> <Esc>

"" \t handled properly & PEP8
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4

set autoindent
set smartindent

set textwidth=79

"" Enable W for saving as an alias
command! W w

filetype plugin on
filetype indent on

"" set <leader> as -
let mapleader="-"
let maplocalleader="-"

set wrap
set cursorline
set wildignore=*.pyc
set showmode

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

"" Functions definition
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

function! SetCustomStatusLine(alert_msg)
    "" Returns the string for setting the status line
    let st_txt = ''
    ""Full path of the file (up to 30c),<modif flag>
    let st_txt .= '%.30F%M'

    "" Custom text with different color (user-defined in colorcheme & restored)
    let st_txt .= "%2*"
    let st_txt .= a:alert_msg
    let st_txt .= "%1*"

    "" Switch to the right side
    let st_txt .= '%='
    "" File Type
    let st_txt .= 'Type:%y'
    ""<col> <line>/<tot>(%)
    let st_txt .= '[Col:%c Line:%l/%L(%p%%)]'
    return st_txt
endfunction

function! TogglePasteMode()
    set paste!
    if &paste
        set statusline=%!SetCustomStatusLine('[PASTE]')
    else
        set statusline=%!SetCustomStatusLine('')
    endif
    return &paste
endfunction
"" End functions definition

"" Mark the limit of <text-width>
nnoremap <leader>j :call SetPageLimit()<CR>
nnoremap <leader>p :call TogglePasteMode()<CR>

call SetPageLimit()  " Enabled by default
set statusline=%!SetCustomStatusLine('')

nnoremap ;t :vimgrep /\<TODO\>/j **/*.py<CR>:cw<CR>
