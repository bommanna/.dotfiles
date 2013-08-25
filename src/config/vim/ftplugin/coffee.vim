setlocal comments=b:#
setlocal textwidth=79


" Compiling:

function! s:compile_file()
  " look in last line of file for compiling options
  " by default compile into same folder
  echo 'Compiling...'
  let last_line = getline('$')
  if last_line[0] ==# '#'
    let compile_options = last_line[2:]
  else
    let compile_options = ''
  endif
  let output = system('coffee -c ' . compile_options . ' ' . expand('%:p'))
  redraw!
  if v:shell_error
    echoerr 'Compilation failed: ' . output
  else
    echo 'Compilation successful!'
  endif
endfunction

function! s:open_compiled_file()
  " open compiled javascript file
  let last_line = getline('$')
  let filename = expand('%:t:r') . '.js'
  if last_line[0] ==# '#'
    let matches = matchlist(last_line, '\(-[^-\s]*o\|--output\)\s\(\S\+\)')
    if len(matches)
      let output_dir = substitute(matches[2], '[^/]\zs$', '/', '')
    else
      let output_dir = ''
    endif
  else
    let output_dir = ''
  endif
  let filepath = expand('%:p:h') . '/' . output_dir . filename
  if filereadable(filepath)
    let autoread_save = &autoread
    let &autoread = 1
    execute 'edit ' . filepath
    let &autoread = autoread_save
  else
    echoerr 'No compiled file found at ' . filepath
  endif
endfunction

function! s:compile_selection() range
  " show compiled code from selection and adjust window height
  execute a:firstline . ','. a:lastline . 'CoffeeCompile'
  let n_lines = line('$')
  execute 'resize ' . min([n_lines, 20])
endfunction

nnoremap <leader>c :call <SID>compile_file()<cr>
nnoremap <leader>C :call <SID>open_compiled_file()<cr>
vnoremap <leader>c :call <SID>compile_selection()<cr>


" Executing:

nnoremap <leader>x :CoffeeRun<cr>
