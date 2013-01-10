" PATHOGEN:
call pathogen#infect()
call pathogen#helptags()

" GENERAL:
syntax enable
filetype plugin on
set number
set nostartofline
set autoindent
set showtabline=2
set wildignore=*.swp,*.bak,*.pyc,*.class
set noswapfile
set scrolloff=5
set cursorcolumn
set cursorline
set foldcolumn=2
set foldmethod=indent
set foldminlines=0
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
set incsearch
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
        let result = system('coffee -o ' . dest . ' -c ' . src)
      elseif &ft ==# 'haml'
        let result = system('haml-coffee -i . -o ' . dest)
      elseif &ft ==# 'stylus'
        let result = system('stylus ' . src . ' --out ' . dest)
      endif
    endif
    if v:shell_error
      echo result
    endif
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

" MAPPINGS:
inoremap <tab> <esc>
vnoremap <tab> <esc>
noremap <c-l> :tabnext<cr>
noremap <c-h> :tabprevious<cr>
inoremap <c-l> <esc>:tabnext<cr>
inoremap <c-h> <esc>:tabprevious<cr>
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>ea :e 
noremap <leader>ee :e .<cr>
noremap <leader>ta :tabnew 
noremap <leader>te :tabnew .<cr>
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>ra <esc>:%s/
noremap <leader>re <esc>:set relativenumber<cr>:.,+
noremap <leader>pa :set paste!<cr>
noremap <silent> <space> :nohlsearch<cr>:set number<cr>
noremap j gj
noremap k gk
noremap Q <nop>
