" PATHOGEN:
call pathogen#infect()
call pathogen#helptags()

" GENERAL:
syntax enable
filetype plugin on
set hidden
set number
set nostartofline
set autoindent
set wildmenu
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
set colorcolumn=80
set showbreak=>>\ \ 
set t_Co=256
set background=dark
set incsearch
set hlsearch
set ignorecase
set smartcase
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
      let srcdir = expand('%:p:h')
      let dest = srcdir . '/' . firstLine[2]
      if &ft ==# 'coffee'
        let result = system('coffee -o ' . dest . ' -c ' . src)
      elseif &ft ==# 'haml'
        let result = system('haml-coffee -b -i ' . firstLine[3] . ' -o ' . dest)
      elseif &ft ==# 'stylus'
        let result = system('stylus ' . src . ' --out ' . dest)
      endif
      if v:shell_error
        echo result
      endif
    endif
  endif
endfunction

" GENERAL AUTOCOMMANDS:
augroup general
  au!
  au  InsertEnter         *           set nocursorline
  au  InsertLeave         *           set cursorline
  au  WinLeave            *           set nocursorline | set nocursorcolumn
  au  WinEnter            *           set cursorline | set cursorcolumn
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

" NERDTREE:
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1
augroup nerdtreegroup
  au!
  autocmd FileType nerdtree noremap <buffer> <silent> <space> :nohlsearch<cr>
augroup END

" MAPPINGS:
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
inoremap <c-h> <esc><c-w>h
inoremap <c-j> <esc><c-w>j
inoremap <c-k> <esc><c-w>k
inoremap <c-l> <esc><c-w>l
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>Q :bd<cr>
noremap <leader>f :NERDTreeToggle<cr><c-w>=<cr>
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>ra :%s/
noremap <leader>re :set relativenumber<cr>:.,+
noremap <silent> <space> :nohlsearch<cr>:set number<cr>
noremap j gj
noremap k gk
noremap Q :set paste!<cr>

" ABBREVIATIONS:
iabbr MM Matthieu Monsch

