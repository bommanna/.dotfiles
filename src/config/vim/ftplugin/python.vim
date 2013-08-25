setlocal comments=b:#
setlocal keywordprg=pydoc
setlocal textwidth=79


" Executing:

nnoremap <leader>x :%w !python<cr>
nnoremap <leader>X :!python %<cr>
vnoremap <leader>x :w !python<cr>
vnoremap <leader>X :!python<cr>


" Testing:

function! s:test_module(filename)
  " test current module
  let test_filename = findfile('test_' . a:filename, '**')
  if strlen(test_filename) && filereadable(test_filename)
    echom 'running tests from ' . test_filename
    execute '!nosetests ' . test_filename
  else
    echoerr 'No test file found for this module.'
  endif
endfunction

function! s:test_all()
  " run all tests in repository
  execute '!nosetests'
endfunction

nnoremap <leader>t :call <SID>test_module(expand('%:t'))<cr>
nnoremap <leader>T :call <SID>test_all()<cr>
