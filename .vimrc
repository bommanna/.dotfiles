" PATHOGEN:
call pathogen#infect()
call pathogen#helptags()

" GENERAL:
syntax enable
filetype plugin on
set nu
set showtabline=2
set wildignore=*.swp,*.bak,*.pyc,*.class
set noswapfile
set scrolloff=5
set cursorcolumn
set cursorline
set foldcolumn=2
set foldmethod=indent
set textwidth=0
set wrap
set linebreak
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=0
set showbreak=>>\ \ 
set t_Co=256
set background=dark
set hlsearch
colorscheme solarized

" STATUS LINE:
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

" LATEX:
" To install, run the following command in VIM after downloading the files"
" :helptags ~/.vim/doc
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" FUNCTIONS:

function! Retab ()
  set tabstop=4
  set noexpandtab
  %retab!
  set tabstop=2
  set expandtab
  %retab
endfunction

function! AutoCompile ()
  let firstLine = split(getline(1))
  if len(firstLine) > 2
    if firstLine[1] ==# 'AUTOCOMPILE'
      let src = expand('%')
      let dest = firstLine[2]
      if &ft ==# 'coffee'
        echo system('coffee -o ' . dest . ' -c ' . src)
      elseif &ft ==# 'haml'
        echo system('haml-coffee -i . -o ' . dest)
      elseif &ft ==# 'stylus'
        echo system('stylus ' . src . ' --out ' . dest)
      endif
    endif
    echom 'File autocompiled to ' . dest . ' !'
  endif
endfunction

" GENERAL AUTOCOMMANDS:
augroup general
  au!
  au  InsertEnter         *           set nocursorline
  au  InsertLeave         *           set cursorline
  au  BufWritePost        *           call AutoCompile()
augroup END

" COFFEE:
augroup coffeegroup
  au!
  au  FileType            coffee        setlocal colorcolumn=80
augroup END

" PYTHON:
augroup pythongroup
  au!
  au  FileType            python        setlocal colorcolumn=80
augroup END

" ALIASES:
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <Space> :nohlsearch<CR>
nnoremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::gc<Left><Left><Left><Left>
noremap j gj
noremap k gk
inoremap <esc> <nop>
noremap Q <nop>
