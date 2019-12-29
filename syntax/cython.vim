""" Source file: https://github.com/lambdalisue/vim-cython-syntax/blob/master/syntax/cython.vim
if exists('b:current_syntax')
  finish
endif

" Do not highlight cython builtin
let g:cython_no_builtin_highlight =
      \ get(g:, 'cython_no_builtin_highlight', get(g:, 'python_no_builtin_highlight'))

" Do not highlight compile directives
let g:cython_no_directive_highlight =
      \ get(g:, 'cython_no_directive_highlight', 0)

" Use Python syntax as base syntax
runtime! syntax/python.vim
unlet b:current_syntax

" C types
syntax keyword cythonType const signed unsigned
syntax keyword cythonType char short int long bint
syntax keyword cythonType float double
syntax keyword cythonType void object

" While Cython use 'from' in import/cimport, cdef-extern, and for-loop, it
" could not be listed in 'pythonInclude' syntax as a keyword.
" So remove 'pythonInclude' and re-define it as 'cythonInclude' without 'from'
" keyword here.
syntax clear   pythonInclude
syntax keyword cythonInclude  import cimport include
syntax match   cythonInclude  display '\<from\>\ze.*\<c\?import\>'

" While Cython has a bit different syntax for for-loop, re-define pythonRepeat
" as cythonRepeat to support 'from' and 'from ... by' syntax
syntax clear   pythonRepeat
syntax keyword cythonRepeat while for
syntax keyword cythonRepeat contained from by
syntax match   cythonRepeatCondition '\%(\<for\>\)\@<=.*\<from\>.*:'         contains=cythonRepeat
syntax match   cythonRepeatCondition '\%(\<for\>\)\@<=.*\<from\>.*\<by\>.*:' contains=cythonRepeat

" DEF ...
" IF ... ELIF ... ELSE
syntax keyword cythonDefine DEF IF ELIF ELSE

" ... nogil:
" ... expect
syntax match cythonStatement display '\<nogil:\?$'          containedin=cythonStatement
syntax match cythonStatement display '\<expect\ze?\?\>.*:$' containedin=cythonStatement

" Typedef
syntax match cythonStatement display '\<ctypedef\>' nextgroup=cythonType skipwhite

" Function
syntax match   cythonStatement  display '\<cp\?def\>' nextgroup=cythonAccessor,cythonReturnType,cythonStructure skipwhite
syntax match   cythonStatement  display '\<cdef\s\+extern\s\+from\>' nextgroup=cythonReturnType skipwhite
syntax match   cythonStatement  display '\<namespace\>' nextgroup=pythonString skipwhite
syntax keyword cythonAccessor   inline extern public api readonly contained nextgroup=cythonAccessor,cythonReturnType,cythonStructure
syntax match   cythonReturnType display '\%(\h\%(\w\|\.\)\+\)@=.{-}' contains=cythonType nextgroup=cythonFunction skipwhite
syntax match   cythonFunction   display '\%(\<cp\?def\>.*\)\@<=\h\%(\w\|\.\)\+\ze('

" Structure
syntax match  cythonStructure display '\<cppclass\>' nextgroup=cythonFunction skipwhite
syntax match  cythonStructure display '\<struct\>' nextgroup=cythonFunction skipwhite
syntax match  cythonStructure display '\<union\>' nextgroup=cythonFunction skipwhite
syntax match  cythonStructure display '\<enum\>' nextgroup=cythonFunction skipwhite
syntax match  cythonStructure display '\<ctypedef\s\+fused\>' nextgroup=cythonFunction skipwhite
syntax match  cythonFunction  display contained '\h\%(\w\|\.\)\+\ze\%((\|:\)'

" Compiler directives
if !g:cython_no_directive_highlight
  syntax match   cythonDirective      display   '\<cython: .*' contains=cythonDirectiveTerms containedin=pythonComment
  syntax keyword cythonDirectiveTerms contained boundscheck wraparound initializedcheck
  syntax keyword cythonDirectiveTerms contained nonecheck overflowcheck overflowcheck.fold
  syntax keyword cythonDirectiveTerms contained embedsignature cdivision cdivision_warnings
  syntax keyword cythonDirectiveTerms contained always_allow_keywords profile linetrace
  syntax keyword cythonDirectiveTerms contained infer_types language_level
  syntax keyword cythonDirectiveTerms contained c_string_type c_string_encoding
  syntax keyword cythonDirectiveTerms contained type_version_tag unraisable_tracebacks
endif

" Default highlighting
highlight default link cythonType           Type
highlight default link cythonReturnType     cythonType
highlight default link cythonInclude        pythonInclude
highlight default link cythonRepeat         pythonRepeat
highlight default link cythonStatement      pythonStatement
highlight default link cythonStructure      cythonStatement
highlight default link cythonAccessor       cythonStatement
highlight default link cythonFunction       pythonFunction
highlight default link cythonDefine         Macro
highlight default link cythonBuiltin        pythonBuiltin

highlight default link cythonDirective      pythonComment
highlight default link cythonDirectiveTerms Define

let b:current_syntax = 'cython'
