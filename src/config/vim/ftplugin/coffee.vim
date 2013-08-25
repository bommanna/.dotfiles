setlocal comments=b:#
setlocal makeprg=coffee\ -c
setlocal textwidth=79


" Compiling:

function! b:get_default_compilation_options()
  return expand('%')
endfunction

function! b:get_compiled_filepath()
  let last_line = getline('$')
  let filename = expand('%:t:r') . '.js'
  if last_line[0] ==# '#'
    let matches = matchlist(last_line, '\(-[^-\s]*o\|--output\)\s\(\S\+\)')
    if len(matches)
      let output_dir = g:expand_all(substitute(matches[2], '[^/]\zs$', '/', ''))
    else
      let output_dir = ''
    endif
  else
    let output_dir = ''
  endif
  return output_dir . filename
endfunction

function! s:compile_selection() range
  " show compiled code from selection and adjust window height
  execute a:firstline . ','. a:lastline . 'CoffeeCompile'
  let n_lines = line('$')
  execute 'resize ' . min([n_lines, 20])
endfunction

vnoremap <buffer> <leader>c :call <SID>compile_selection()<cr>


" Executing:

nnoremap <buffer> <leader>x :CoffeeRun<cr>
