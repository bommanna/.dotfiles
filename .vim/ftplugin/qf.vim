" quickfix

function! s:resize_window(min_lines, max_lines)
  " resize window dynamically
  let total_lines = line('$')
  let height = min([a:max_lines, max([a:min_lines, total_lines])])
  execute "resize " . height
endfunction

setlocal nowrap
setlocal statusline=%f%=%l/%L

execute "wincmd J"
call s:resize_window(1, 20)

nnoremap <silent> <buffer> <cr> :OpenInPreviousWindow .cc<cr>
nnoremap <silent> <buffer> O :OpenInPreviousWindow .cc<cr>zz:copen<cr>
nnoremap <silent> <buffer> V <c-w><cr>:ccl<cr><c-w>H:copen<cr>
nnoremap <silent> <buffer> o :OpenInPreviousWindow .cc<cr>
nnoremap <silent> <buffer> q <c-w>p:ccl<cr>
nnoremap <silent> <buffer> v <c-w><cr>:ccl<cr><c-w>H:copen<cr><c-w>p
