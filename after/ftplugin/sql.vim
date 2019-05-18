"" Source: https://github.com/alcesleo/vim-uppercase-sql/blob/master/ftplugin/sql.vim
function! s:UppercaseKeyword(sql)
    " Do not uppercase word if within a comment or string
    if synIDattr(synIDtrans(synID(line("."), col(".") - 1, 0)), "name") =~# 'Comment\|String'
        return a:sql
    else
        return toupper(a:sql)
    endif
endfunction

iabbrev <expr> <buffer> select <SID>UppercaseKeyword('select')
iabbrev <expr> <buffer> from <SID>UppercaseKeyword('from')
iabbrev <expr> <buffer> where <SID>UppercaseKeyword('where')
iabbrev <expr> <buffer> group <SID>UppercaseKeyword('group')
iabbrev <expr> <buffer> by <SID>UppercaseKeyword('by')
iabbrev <expr> <buffer> having <SID>UppercaseKeyword('having')
iabbrev <expr> <buffer> order <SID>UppercaseKeyword('order')
iabbrev <expr> <buffer> limit <SID>UppercaseKeyword('limit')
iabbrev <expr> <buffer> offset <SID>UppercaseKeyword('offset')
