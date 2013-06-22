" SAFETY:
filetype off


" GLOBAL VARIABLES:

" Latex
let g:LatexBox_no_mappings=1                                  " don't automatically create mappings for latex-box
let g:tex_flavor='latex'                                      " 
let g:Tex_DefaultTargetFormat='pdf'                           "

" Python
" let g:pymode = 1
let g:pymode_folding = 0                                      " python folding
let g:pymode_lint = 0                                         " load lint plugin for code checking
let g:pymode_lint_checker = ''                                " pyflakes,pep8,mccable,pylint
let g:pymode_motion = 0                                       " python objects and motion
let g:pymode_rope = 0                                         " load rope plugin for code refactoring
let g:pymode_run = 0                                          " load run code plugin
let g:pymode_syntax = 0                                       " pymode's custom syntax highlighting
let g:pymode_virtualenv = 1                                   " switch to virtualenv pythonpath if in a virtualenv

" Rooter
let g:rooter_patterns = ['.git/']
let g:rooter_use_lcd = 1


" PATHOGEN:

call pathogen#infect()
call pathogen#helptags()


" SETTINGS:

" magic
filetype plugin on                                            " enable loading of plugins per filetype
syntax enable                                                 " activate syntax highlighting
syntax sync fromstart                                         " otherwise folding messes up highlighting

" general
set autoindent                                                " smarter indentation
set backspace=indent,eol,start                                " allow backspace to delete new lines, etc.
set encoding=utf-8                                            " duh
set expandtab                                                 " insert spaces instead of a tab when tabbing
set hidden                                                    " allow hidden buffers
set lazyredraw                                                " don't redraw during macros, etc
set linebreak                                                 " ? for latex
set nostartofline                                             " keeps cursor on current column for movements like H, M, ...
set noswapfile                                                " don't use swap files for saves
set number                                                    " activate line numbers
set omnifunc=syntaxcomplete#Complete                          " omnicompletion using syntax keywords
set scrolloff=5                                               " allow 5 lines below/above the cursor
set shell=/bin/bash\ --rcfile\ ~/.bashrc                      " load .bashrc when starting shell from vim
set shellslash                                                " use forward slashes for paths, always
set shiftwidth=2                                              " spaces used for indent keys (>>, ...) and for autoindent
set tabstop=2                                                 " number of spaces a tab takes (displayed)
set tag=./tags;,./venvtags;                                   " tags file
set textwidth=0                                               " don't insert line breaks for long lines
set wrap                                                      " wrap long lines

" autocomplete
set completeopt=longest,menuone                               " only insert longest common strings of suggestions
set wildignore=*.swp,*.bak                                    " don't show these files in autocompletion
set wildignore+=*.pyc,*.class                                 " 
set wildmenu                                                  " allow autocompletion with c-n

" undohistory
set undodir=~/.vim/undo                                       " saves directory
set undofile                                                  " allow persistence of undo history
set undolevels=1000                                           " number of operations used
set undoreload=1000                                           " number of operations stored

" folds
set fillchars="fold: "                                        " don't show hyphens after folds
set foldcolumn=2                                              " width of the fold column
set foldlevelstart=4                                          " open folds on open
set foldmethod=indent                                         " fold by indent
set foldminlines=0                                            " allow folding of single lines
set foldnestmax=3                                             " maximum fold level

" theme
colorscheme solarized                                         " colorscheme
set background=dark                                           " theme, autodetected
set colorcolumn=                                              " don't highlight any columns
set cursorcolumn                                              " highlight the current column
set cursorline                                                " highlight the current row
set showbreak=>>\ \                                           " characters shown on display linebreak
set t_Co=256                                                  " terminal colors

" search
set hlsearch                                                  " highlight all matches after executing search query
set ignorecase                                                " if all lowercase in search query, ignore case
set incsearch                                                 " highlight potential matches as search query is being typed
set smartcase                                                 " if some uppercase in search query, respect case

" status line
set statusline=%f                                             " Path to the file
set statusline+=%=                                            " Switch to the right side
set statusline+=%l                                            " Current line
set statusline+=/                                             " Separator
set statusline+=%L                                            " Total lines
set laststatus=2                                              " always show status line

" spelling
set dictionary=/usr/share/dict/words                          " files where to load word for dictionary
set dictionary+=~/.vim/spell/custom-dictionary.utf-8.add      "   completion for use with <c-x><c-k>
set spellfile=~/.vim/spell/custom-dictionary.utf-8.add        " file where to add new dict words

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
" usage (coffee, stylus):
" # AUTOCOMPILE destination
" usage (haml):
" # AUTOCOMPILE destination origin_directory
" notes:
" * destination path is relative to the current file's directory
" * origin_folder is relative to vim's current work directory
" * replace the hash sign by the language's comment symbol
" * form haml, all the files in the origin_folder will be compiled into a
"   single destination file
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


" AUTOCOMMANDS AND PLUGIN VARIABLES:

augroup general
  autocmd!
  autocmd   InsertEnter   *             set nocursorline
  autocmd   InsertLeave   *             set cursorline
  autocmd   WinLeave      *             set nocursorline | set nocursorcolumn
  autocmd   WinEnter      *             set cursorline | set cursorcolumn
  autocmd   BufWritePost  *             call AutoCompile()
augroup END

augroup latexgroup
  autocmd!
  autocmd   FileType      tex           nnoremap <buffer> <leader>ll :!latexmk -pdf -cd %<cr>
  autocmd   FileType      tex           nnoremap <buffer> <leader>lt :LatexTOC<cr>
augroup END

let NERDTreeIgnore = ['\.pyc$', '^\.DS_Store']
let NERDTreeQuitOnOpen = 1
augroup nerdtreegroup
  autocmd!
  autocmd   FileType      nerdtree      noremap <buffer> <silent> <space> :nohlsearch<cr>
augroup END

let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Highlight_Tag_On_BufEnter=0
let Tlist_Show_One_File=1
let Tlist_Sort_Type="name"
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=60
augroup taglistgroup
  autocmd!
  autocmd   FileType      taglist       noremap <buffer> <silent> <leader>t <c-w>p
  autocmd   FileType      taglist       set nocursorline | set nocursorcolumn
  autocmd   BufWritePost  *             TlistUpdate
augroup END

augroup pythongroup
  autocmd!
  autocmd   FileType      python        setlocal colorcolumn=80
  autocmd   FileType      python        setlocal omnifunc=pythoncomplete#Complete
augroup END

augroup coffeegroup
  autocmd!
  autocmd   FileType      coffee        setlocal colorcolumn=80
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
nnoremap <leader>f :NERDTreeToggle<cr>

" toggle taglist
nnoremap <leader>t :TlistHighlightTag<cr>:TlistOpen<cr>
nnoremap <leader>T :TlistToggle<cr><c-w>=<cr>

" .vimrc sugar (open in horizontal split, source)
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" replace (all, on current line, from current line)
nnoremap <leader>ra q:i%s/
nnoremap <leader>re q:i.s/
nnoremap <leader>rr zz:set relativenumber<cr>q:i.,+

" execute file using bash
nnoremap <leader>bb :%w !bash<cr>

" execute file using shell python
nnoremap <leader>pp :%w !python<cr>

" execute file using shell ipython or python and go in interactive mode
" note that this saves the file first
nnoremap <leader>pi :w<cr>:!ipython -i %<cr>
nnoremap <leader>py :w<cr>:!python -i %<cr>

" run pylint on file (this saves the file first)
nnoremap <leader>pl :w<cr>:!pylint %<cr>

" toggle search highlight off and restore numbers
nnoremap <silent> <space> :nohlsearch<cr>:set number<cr>

" visual up, down, end of line, start of line (useful for long lines)
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

" don't move on * and #
nnoremap * *<c-o>
nnoremap # #<c-o>

" paste
nnoremap <leader>pa :set paste!<cr>i

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

" changing background color
nnoremap <leader>bgd :set background=dark<cr>
nnoremap <leader>bgl :set background=light<cr>

" always use command line window
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

" quick open shell
nnoremap Q q:ishell<cr>

" always use command line window
vnoremap : q:i
vnoremap / q/i
vnoremap ? q?i
vnoremap Q q:i!

" autocomplete shortcuts
inoremap <c-k> <c-x><c-k>
inoremap <c-j> <c-x><c-o>
inoremap <c-l> <c-x><c-l>
inoremap <c-h> <c-x><c-f>

" matching bracket step back
inoremap <c-f> <esc>%a

" easier indentation
vnoremap > >gv
vnoremap < <gv

" execute selection using bash (no replacement)
vnoremap <leader>bb :w !bash<cr>

" execute selection with shell python (without replacing selection)
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
iabbr #! #!/usr/bin/env
