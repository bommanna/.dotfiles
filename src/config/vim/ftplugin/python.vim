setlocal comments=b:#,b:#:
setlocal textwidth=79

" Execution mappings
nnoremap <leader>x :%w !python<cr>
nnoremap <leader>X :!python %<cr>
vnoremap <leader>x :w !python<cr>
vnoremap <leader>X :!python<cr>

" Activate virtualenv if present

python << EOF
import vim
from os.path import join
from sys import path

venv_dir = vim.eval('$VIRTUAL_ENV')
if venv_dir:
  filepath = join(join(venv_dir, 'bin'), 'activate_this.py')
  execfile(filepath, dict(__file__=filepath))
  vim.command('echom "Virtualenv activated: %s." | redraw!' % (venv_dir, ))
EOF
