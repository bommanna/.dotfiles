setlocal comments=b:-#
setlocal formatoptions-=o


" Compiling:

function! s:compile_file()
  " look in last line of file for compiling options
  " two cases: .haml and .hamlc files, compiled differently
  " if .haml, both the input and output MUST be present and specified last
  " to simplify things, vim filename expansion is enabled
  " cf. the `output` snippet for a sample
  " if .hamlc, simply follow the command line options format
  " note that this implies that the -i option should be set
  " -o should also be set if compiling and merging several files
  echo 'Compiling...'
  let last_line = getline('$')
  if expand('%:e') ==# 'hamlc'
    if last_line[0:1] ==# '-#'
      let compile_options = substitute(last_line[3:],
                                    \ '\(^\|\s\|/\)\zs%:\?[:phtre]*',
                                    \ '\=expand(submatch(0))',
                                    \ 'g')
    else
      let compile_options = '-i ' . expand('%:p')
    endif
    let output = system('haml-coffee ' . compile_options)
  else
    if last_line[0:1] ==# '-#'
      let compile_options = substitute(last_line[3:],
                                    \ '\(^\|\s\|/\)\zs%:\?[:phtre]*',
                                    \ '\=expand(submatch(0))',
                                    \ 'g')
    else
      let compile_options = expand('%:p') . ' ' . expand('%:t:r') . '.html'
    endif
    let output = system('haml ' . compile_options)
  endif
  redraw!
  if v:shell_error
    echoerr 'Compilation failed: ' . output
  else
    echo 'Compilation successful!'
  endif
endfunction

function! s:open_compiled_file()
  " open compiled html/jst file
  let last_line = getline('$')
  if expand('%:e') ==# 'hamlc'
    if last_line[0:1] ==# '-#'
      let compile_options = substitute(last_line[3:],
                                    \ '\(^\|\s\|/\)\zs%:\?[:phtre]*',
                                    \ '\=expand(submatch(0))',
                                    \ 'g')
      let matches = matchlist(last_line, '\(-[^-\s]*o\|--output\)\s\(\S\+\)')
      if len(matches)
        let filepath = matches[2]
      else
        let filepath = expand('%:p:r') . '.jst'
      endif
    else
      let filepath = expand('%:p:r') . '.jst'
    endif
  else
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

nnoremap <buffer> <leader>c :call <SID>compile_file()<cr>
nnoremap <buffer> <leader>C :call <SID>open_compiled_file()<cr>
