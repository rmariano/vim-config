"" Vim configuration
" Maintainer: Mariano Anaya
" Version: v0.14
" Created: 01 Jan 2014
""""""""""""""""""""""""""""""

set t_Co=256  "" Vim & terminal Mode in 256-colors
if &term =~ '256color'
    set t_ut=
endif

syntax on
colorscheme tromso
set number
"" highlight and do incremental search
set hlsearch
set incsearch
"" show all menu options
set wildmenu
set showmatch
set history=50

"" \t handled properly & PEP8
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4

"" Enable W for saving as an alias
command! W w
command! Wq wq
command! WQ wq

"" New regex engine
set regexpengine=0
filetype plugin indent on

"" set <leader> as -
let mapleader="-"
let maplocalleader="-"

set wrap
set cursorline
set wildignore=*.pyc,**/__pycache__*
set showmode
set autoread
set autowrite
set autowriteall
set hidden

set nomodeline


"" Where to open new windows
set splitright
set nosplitbelow

"" Lines range visible when scrolling
set scrolloff=10

"" Performance improvements
set lazyredraw
set ttyfast
set synmaxcol=300

"" Do not ring errors
set noerrorbells
set novisualbell

set autoindent
set smartindent
set textwidth=120

set nofoldenable  "" Don't fold

"" look for trailing white spaces
nnoremap <leader>tw /\s\+$<CR>
nnoremap <leader>w :%s/\s\+$//g<CR>

set laststatus=2  ""Always display the status bar

nnoremap <leader>nh :nohlsearch<CR>
"" Save as sudo
cnoremap w!! w !sudo tee % >/dev/null

"" Custom mappings for quick-fix window
nnoremap <leader>n :cnext<cr>
nnoremap <leader>b :cprevious<cr>
nnoremap <leader>q :cclose<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

"" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<CR>

"" Function definitions
function! SearchDevTags()
   let status = 0
   try
       execute ":vimgrep /\\(TODO\\|FIXME\\)/j **/*.py"
       let status = 1
   catch /E480:/
       highlight MSGOK ctermbg=darkgreen ctermfg=white cterm=bold
       echohl MSGOK | echom "(OK - No pending tasks :-)" | echohl None
   finally
       if status
           copen  "quick-fix window
       endif
   endtry
   return status
endfunction

function! TogglePageLimit(...)
    if a:0 > 0
        let s:to_set = a:1
    else
        let s:to_set = 0
    endif
    if &colorcolumn && !s:to_set
        let &colorcolumn=0
    else
        let s:margin=join(range(&textwidth+1, &columns+1), ",")
        let &colorcolumn=s:margin
    endif
    return &colorcolumn
endfunction

function! SetCustomStatusLine(alert_msg)
    "" Returns the string for setting the status line
    let st_txt = ''
    ""Full path of the file (up to 30c),<modif flag>
    let st_txt .= '%.30F%M'

    "" Different color (user-defined in color scheme & restored)
    let st_txt .= "%2*"
    let st_txt .= a:alert_msg
    let st_txt .= "%1*"

    "" Switch to the right side
    let st_txt .= '%='
    "" File Type
    let st_txt .= "%3*"
    let st_txt .= '%y'
    ""<col> <line>/<tot>(%)
    let st_txt .= "%4*"
    let st_txt .= '[Col:%c Line:%l/%L(%p%%)]'
    return st_txt
endfunction


function! ToggleLangCheck()
    if !&spell
        setlocal spell spelllang=en_us
        set statusline=%!SetCustomStatusLine('[spell]')
    else
        setlocal nospell
        set statusline=%!SetCustomStatusLine('')
    endif
    return &spell
endfunction

function! FormatXML()
    echom "Formatting XML file"
    execute ":silent %!xmllint --format --recover - 2>/dev/null"
endfunction

function! CopyContentToClipboard()
    if executable("clip.exe")
        execute ":silent '<,'>w !clip.exe"
    elseif executable("xclip")
        execute ":silent '<,'>w !xclip"
    elseif executable("pbcopy")
        execute ":silent '<,'>w !pbcopy"
    endif
endfunction
"" End of function definitions

"" Mark the limit of <text-width>
nnoremap <leader>j :call TogglePageLimit()<CR>
nnoremap ;t :call SearchDevTags()<CR>

"" Copy selected content (visual model) to clipboard
vnoremap <C-C> :call CopyContentToClipboard()<CR>

set statusline=%!SetCustomStatusLine('')
map <F2> :call ToggleLangCheck()<CR>
set pastetoggle=<F4>

"" Other configurations

""" Python: Highlight everything
let g:python_highlight_all = 1
""" Remove trailing white spaces upon saving
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <leader>e :set number!<CR>

""" Configurations per file type
autocmd FileType xml map <F3> :call FormatXML()<CR>

"" Set filetypy=cython according to the extension
augroup cython_ft
    au!
    autocmd BufNewFile,BufRead *.{pyx,pxd,pxi} set filetype=cython
augroup END

"" No error bell
set noerrorbells visualbell t_vb=
