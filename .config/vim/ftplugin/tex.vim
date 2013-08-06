setlocal keywordprg=texdoc
setlocal linebreak
setlocal nolist
setlocal spell

" save before compiling
nnoremap <buffer> <leader>ll :w<cr>:Latexmk<cr>
