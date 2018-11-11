"" Settings for Rust

"" Fix a Rust file: auto-format with ``rustfmt``
function! AutofixRust()
    echom "Correcting Rust file"
    if executable("rustfmt")
        execute ":silent %!rustfmt"
    endif
    :w
endfunction

map <F3> :call AutofixRust()<CR>
