setlocal comments=b:#
setlocal textwidth=79

" Executing:

nnoremap <leader>x :%w !python<cr>
nnoremap <leader>X :!python %<cr>
vnoremap <leader>x :w !python<cr>
vnoremap <leader>X :!python<cr>


" Testing:

function! s:test_module(filename)
  " test current module
  let test_filename = 'test/test_' . a:filename
  if filereadable(test_filename)
    execute '!nosetests ' . test_filename
  else
    echoerr 'No test file found for this module.'
  endif
endfunction

function! s:test_all()
  " run all tests in repository
  if filewritable('test') ==# 2
    execute '!nosetests test'
  endif
endfunction

nnoremap <leader>t :call <SID>test_module(expand('%:t'))<cr>
nnoremap <leader>T :call <SID>test_all()<cr>
