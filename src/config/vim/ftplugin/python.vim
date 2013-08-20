setlocal comments=b:#,b:#:
setlocal textwidth=79

" Execution mappings
nnoremap <leader>x :%w !python<cr>
nnoremap <leader>X :!python %<cr>
vnoremap <leader>x :w !python<cr>
vnoremap <leader>X :!python<cr>
