setlocal comments=b:-#
setlocal formatoptions-=o


" Compiling:

function! s:compile_file()
  " look in last line of file for compiling options
  " if present, both the input and output MUST be present
  " to simplify things, vim filename expansion is enabled
  " cf. the `output` snippet for a sample
  echo 'Compiling...'
  let last_line = getline('$')
  if last_line[0:1] ==# '-#'
    let compile_options = substitute(last_line[3:],
                                   \ '\(^\|\s\|/\)\zs%:\?[:phtre]*',
                                   \ '\=expand(submatch(0))',
                                   \ 'g')
  else
    let compile_options = expand('%:p') . ' ' . expand('%:t:r') . '.html'
  endif
  let output = system('haml ' . compile_options)
  redraw!
  if v:shell_error
    echoerr 'Compilation failed: ' . output
  else
    echo 'Compilation successful!'
  endif
endfunction

function! s:open_compiled_file()
  " open compiled html file
  let last_line = getline('$')
  if last_line[0:1] ==# '-#'
    let compile_options = substitute(last_line[3:],
                                   \ '\(^\|\s\|/\)\zs%:\?[:phtre]*',
                                   \ '\=expand(submatch(0))',
                                   \ 'g')
    let split_options = split(compile_options)
    let filepath = split_options[len(split_options) - 1]
  else
    let filepath = expand('%:p:r') . '.html'
  endif
  if filereadable(filepath)
    let autoread_save = &autoread
    let &autoread = 1
    execute 'edit ' . filepath
    let &autoread = autoread_save
  else
    echoerr 'No compiled file found at ' . filepath
  endif
endfunction

nnoremap <leader>c :call <SID>compile_file()<cr>
nnoremap <leader>C :call <SID>open_compiled_file()<cr>
