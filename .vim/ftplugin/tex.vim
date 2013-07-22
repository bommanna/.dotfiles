" tex options

" spelling autocorrect
setlocal spell
setlocal linebreak
setlocal nolist

" save before compiling
nnoremap <buffer> <leader>ll :w<cr>:Latexmk<cr>
