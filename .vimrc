" PATHOGEN:
call pathogen#infect()
call pathogen#helptags()

" GENERAL:
syntax enable
filetype plugin on
set hidden                " allow hidden buffers
set number                " activate line numbers
set shell=/bin/bash\ --rcfile\ ~/.bash_profile
set encoding=utf-8        " duh
set nostartofline         " keeps cursor on current column for movements like H, M, ...
set autoindent            " smarter indentation
set wildmenu              " allow autocompletion with c-n
set wildignore=*.swp,*.bak,*.pyc,*.class          " don't show these files in autocompletion
set dictionary=/usr/share/dict/words              " dictionary completion for use with <c-x><c-k>
set spellfile=~/.vim/custom-dictionary.utf-8.add  " file where to add new dict words
set dictionary+=~/.vim/custom-dictionary.utf-8.add
set lazyredraw            " don't redraw during macros, etc
set noswapfile            " don't use swap files for saves
set scrolloff=5           " allow 5 lines below/above the cursor
set cursorcolumn          " highlight the current column
set cursorline            " highlight the current row
set showmatch             " briefly show matching bracket when inserting a new one
set foldcolumn=2          " width of the fold column
set foldnestmax=3         " maximum fold level
set foldmethod=indent     " fold by indent
set foldminlines=0        " allow folding of single lines
set foldlevelstart=4      " open folds on open
set fillchars="fold: "    " don't show hyphens after folds
set textwidth=0           " don't insert line breaks for long lines
set wrap                  " wrap long lines
set linebreak             " ? for latex
set tabstop=2             " number of spaces a tab takes (displayed)
set shiftwidth=2          " number of spaces used when using indent keys (>>, ...) and for autoindent
set expandtab             " insert spaces instead of a tab when tabbing
set colorcolumn=80        " highlight 80th column
set showbreak=>>\ \ 
set t_Co=256              " terminal colors
set background=dark       " theme
set incsearch             " highlight potential matches as search query is being typed
set hlsearch              " highlight all matches after executing search query
set ignorecase            " if all lowercase in search query, ignore case
set smartcase             " if some uppercase in search query, respect case
set laststatus=2          " always show status line
colorscheme solarized     " colorscheme

" STATUS LINE:
" nicer status line
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

" retab file using 2 spaces instead of 4 per tab
function! Retab ()
  set tabstop=4
  set noexpandtab
  %retab!
  set tabstop=2
  set expandtab
  %retab
endfunction

" autocompile coffeescript, haml, stylus on save using a comment on the first line
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

" easy movement around splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" buffer operations (save, close, delete)
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" toggle NERDtree
nnoremap <leader>t :NERDTreeToggle<cr><c-w>=<cr>

" .vimrc sugar (open in horizontal split, source)
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" replace (all, on current line, from current line)
nnoremap <leader>ra q:i%s/
nnoremap <leader>re q:i.s/
nnoremap <leader>rr zz:set relativenumber<cr>q:i.,+

" execute file using bash
nnoremap <leader>bb :%w !bash<cr>

" execute file using shell python
nnoremap <leader>pp :%w !python<cr>

" toggle search highlight off and restore numbers
nnoremap <silent> <space> :nohlsearch<cr>:set number<cr>

" visual up, down (useful for long lines)
nnoremap j gj
nnoremap k gk

" toggle paste mode
nnoremap Q :set paste!<cr>

" ctrlp plugin (search among files, buffers)
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" always use command line window
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

" don't move on * and #
nnoremap * *<c-o>
nnoremap # #<c-o>

" easier movements on the line
nnoremap H ^
nnoremap J L
nnoremap L $
nnoremap K H

" remap join lines
nnoremap $ J

" fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr><c-w>10+
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gh :Gbrowse<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gp :Git push<cr>

" toggle spell checking
nnoremap <leader>sp :set spell!<cr>

" execute selection using bash (no replacement)
vnoremap <leader>bb :w !bash<cr>

" execute selection with shell python (without, with replacing selection)
vnoremap <leader>pp :w !python<cr>

" replace selection (all, one occurrence on current line)
vnoremap <leader>ra "hy/<c-r>h<cr>q:i%s/<c-r>h/
vnoremap <leader>re "hyq:i.s/<c-r>h/

" enable search for selected text, forwards (*) or backwards (#)
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" ABBREVIATIONS:
iabbr MM Matthieu Monsch

