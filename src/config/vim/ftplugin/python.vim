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
    execute '!python ' . test_filename
  else
    echoerr 'No test file found for this module.'
  endif
endfunction

function! s:test_all()
  " run all tests in repository
  if filewritable('test') ==# 2
    execute '!nose test'
  endif
endfunction

nnoremap <leader>t :call <SID>test_module(expand('%:t'))<cr>
nnoremap <leader>T :call <SID>test_all()<cr>

" Virtualenv:

python << EOF
import vim
from os.path import join
from sys import path

venv_dir = vim.eval('$VIRTUAL_ENV')
if venv_dir:
  filepath = join(join(venv_dir, 'bin'), 'activate_this.py')
  execfile(filepath, dict(__file__=filepath))
  vim.command('redraw! | echom "Virtualenv activated: %s."' % (venv_dir, ))
EOF
