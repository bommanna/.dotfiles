" quickfix and location window

setlocal nowrap
setlocal statusline=%f%=%l/%L
setlocal foldcolumn=0

" resize window
" execute "wincmd J"
" call s:resize_window(1, 20)

" mappings
" nnoremap <silent> <buffer> <cr> :OpenInPreviousWindow .cc<cr>
" nnoremap <silent> <buffer> O :OpenInPreviousWindow .cc<cr>zz:copen<cr>
" nnoremap <silent> <buffer> V <c-w><cr>:ccl<cr><c-w>H:copen<cr>
" nnoremap <silent> <buffer> o :OpenInPreviousWindow .cc<cr>
" nnoremap <silent> <buffer> q <c-w>p:ccl<cr>
" nnoremap <silent> <buffer> v <c-w><cr>:ccl<cr><c-w>H:copen<cr><c-w>p
