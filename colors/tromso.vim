" Vim color file
" Maintainer: Mariano Anaya
" Last Change:
" Created: 11 Jan 2014
""""""""""""""""""""""""""""

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "tromso"

"" User-defined colors
"" User1 Same as StatusLine
highlight User1 ctermbg=024 ctermfg=white cterm=bold
highlight User2 ctermbg=darkred ctermfg=white cterm=bold
highlight User3 ctermbg=188 ctermfg=236 cterm=bold
highlight User4 ctermbg=248 ctermfg=236 cterm=bold

highlight Normal ctermfg=188 ctermbg=237 guifg=#dcdccc guibg=#3f3f3f
highlight ErrorMsg ctermbg=darkred ctermfg=white cterm=bold
highlight Visual ctermbg=darkblue ctermfg=white cterm=none
highlight VisualNOS ctermbg=darkblue ctermfg=white cterm=none

highlight LineNr ctermbg=235 ctermfg=250 cterm=bold
highlight Todo ctermbg=darkblue ctermfg=red cterm=bold

highlight StatusLine ctermbg=024 ctermfg=white cterm=bold
highlight StatusLineNC ctermbg=031 ctermfg=white cterm=none

highlight ColorColumn ctermbg=235 cterm=none

highlight Search ctermbg=darkblue ctermfg=white cterm=underline
highlight IncSearch	ctermbg=blue  ctermfg=white cterm=none

highlight WildMenu ctermbg=166 ctermfg=white cterm=bold

highlight Folded ctermbg=darkgrey ctermfg=white cterm=bold
highlight FoldColumn ctermbg=darkgrey ctermfg=white cterm=bold

highlight CursorLine ctermbg=238 ctermfg=none cterm=none
highlight CursorLineNr ctermbg=232 ctermfg=255 cterm=bold

highlight ModeMsg ctermbg=065 ctermfg=white cterm=bold

highlight TabLineSel ctermbg=024 ctermfg=white cterm=bold
highlight TabLine ctermbg=245 ctermfg=white cterm=bold
highlight TabLineFill ctermbg=244 cterm=none

"" Menu bar colors
highlight Pmenu ctermbg=023 ctermfg=220 cterm=none
highlight PmenuSel ctermbg=029 ctermfg=214 cterm=bold
highlight PmenuSbar ctermbg=048

"" [dev] Customized colors
highlight Statement	ctermbg=none ctermfg=202 cterm=bold cterm=bold
highlight Identifier ctermbg=none  ctermfg=143 cterm=bold
highlight Comment ctermbg=none ctermfg=196 cterm=none
highlight Constant ctermbg=none ctermfg=117 cterm=none
highlight type ctermfg=green cterm=none
highlight PreProc ctermfg=magenta cterm=none
highlight Underlined cterm=underline term=underline
