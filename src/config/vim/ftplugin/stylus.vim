" TODO: fix the comments option (the stylus plugin overrides it)
setlocal comments=s1:/*,mb:*,ex:*/,s1:/*!,mb:*,ex:*/,b://
setlocal makeprg=stylus


" Compiling:

function! b:get_default_compilation_options()
  return expand('%:p')
endfunction

function! b:get_compiled_filepath()
  let last_line = getline('$')
  let filename = expand('%:t:r') . '.css'
  if last_line[0:2] ==# '// '
    let matches = matchlist(last_line, '\(-[^-\s]*o\|--out\)\s\(\S\+\)')
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
