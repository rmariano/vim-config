" Vim color file
" Maintainer: Mariano Anaya
" Last Change:
" Created: 11 Jan 2014

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "tromso"

highlight Normal ctermbg=black ctermfg=white cterm=none
highlight ErrorMsg ctermbg=darkred ctermfg=white cterm=bold
highlight Visual ctermbg=darkblue ctermfg=white cterm=none
highlight VisualNOS ctermbg=darkblue ctermfg=white cterm=none

highlight LineNr ctermbg=none ctermfg=cyan cterm=none
highlight Todo ctermfg=red ctermbg=darkblue cterm=bold

highlight StatusLine ctermbg=darkblue ctermfg=white cterm=bold
highlight StatusLineNC ctermbg=blue ctermfg=white cterm=none

highlight ColorColumn ctermbg=234 cterm=none

highlight Search ctermbg=darkblue ctermfg=white cterm=underline
highlight IncSearch	ctermbg=blue  ctermfg=white cterm=none

highlight WildMenu ctermbg=166 ctermfg=white cterm=bold

highlight Folded ctermbg=darkgrey ctermfg=white cterm=bold
highlight FoldColumn ctermbg=darkgrey ctermfg=white cterm=bold


""Menu bar colors
highlight Pmenu ctermbg=023 ctermfg=220 cterm=none
highlight PmenuSel ctermbg=029 ctermfg=214 cterm=bold
highlight PmenuSbar ctermbg=048


"" [dev] Customized colors
highlight Statement	ctermbg=none ctermfg=202 cterm=bold cterm=bold
highlight Identifier ctermbg=none  ctermfg=143 cterm=bold
highlight Comment ctermbg=none ctermfg=196 cterm=none


"" Original: To be modified
hi Constant	ctermfg=magenta guifg=#ffa0a0 cterm=none
hi Special	ctermfg=brown guifg=Orange cterm=none gui=none
hi PreProc	ctermfg=magenta guifg=#ff80ff gui=none cterm=none
hi type		ctermfg=green guifg=#60ff60 gui=none cterm=none
hi Underlined	cterm=underline term=underline
