"" Vim configurations
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

"" Enable W for saving as an alias
command! W w

filetype plugin indent on

"" set <leader> as -
let mapleader = "-"
let maplocalleader = "-"

set wrap

"" cancel the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"" Shortcut for commenting out lines in python files
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

"" Custom status bar
set laststatus=2  ""Always display the status bar
set statusline=%.20F  "" Full path of the file (up to 20c)
set statusline+=%=  "" Switch to the right side
set statusline+=FileType:\ %y\ ""
set statusline+=[Col:\ %c]\ -\ "" Column
set statusline+=[Line:\ %l/%L]\ "" <Current_line>/<total_lines>

"" I never used '.' anyway
nmap . <nop>
