setlocal comments=b:-#
setlocal formatoptions-=o

if expand('%:e') ==# 'hamlc'
  setlocal makeprg=haml-coffee
else
  setlocal makeprg=haml
endif


" Compiling:

function! b:get_default_compilation_options()
  if expand('%:e') ==# 'hamlc'
    return '--input ' . expand('%')
  else
    return expand('%') . ' ' . expand('%:t:r') . '.html'
  endif
endfunction

function! b:get_compiled_filepath()
  let last_line = getline('$')
  if expand('%:e') ==# 'hamlc'
    if last_line[0:2] ==# '-# '
      let matches = matchlist(last_line, '\(-[^-\s]*o\|--output\)\s\(\S\+\)')
      if len(matches)
        let filepath = g:expand_all(matches[2])
      else
        let filepath = expand('%:r') . '.jst'
      endif
    else
      let filepath = expand('%:r') . '.jst'
    endif
  else
    if last_line[0:2] ==# '-# '
      let compile_options = g:expand_all(last_line[3:])
      let split_options = split(compile_options)
      let filepath = split_options[len(split_options) - 1]
    else
      let filepath = expand('%:r') . '.html'
    endif
  endif
  return filepath
endfunction
