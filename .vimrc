" SAFETY:
filetype off


" GLOBAL VARIABLES:

" Ctrlp
let g:ctrlp_user_command = 'ack %s -f'                        " use ack as search index

" EasyMotion
let g:EasyMotion_leader_key = "'"                             " ' key is unbound in normal and visual mode below

" LatexBox
let g:LatexBox_autosave = 1                                   " save before compiling

" NerdTree
let g:NERDTreeIgnore = ['\.pyc$', '^\.DS_Store']              " don't show these files
let g:NERDTreeQuitOnOpen = 1                                  " quit vim in nerdtree is the only buffer open

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
let g:rooter_manual_only = 1                                  " doing it below for all filetypes (otherwise only some activate rooting)
let g:rooter_patterns = ['.git/']
let g:rooter_use_lcd = 1

" Taglist
let g:Tlist_Auto_Highlight_Tag = 1                            " highlight active tag (after a small inactivity period)
let g:Tlist_Auto_Update = 1                                   " process new files as they are opened
let g:Tlist_Compact_Format = 1                                " don't put line breaks between categories
let g:Tlist_Enable_Fold_Column = 0                            " show fold column in taglist window
let g:Tlist_Exit_OnlyWindow = 1                               " quit vim when taglist is the only window open
let g:Tlist_File_Fold_Auto_Close = 1                          " automatically close folds corresponding to non active windows
let g:Tlist_GainFocus_On_ToggleOpen = 0                       " move cursor to taglist window when opening it
let g:Tlist_Highlight_Tag_On_BufEnter = 0                     " highlight active tag when entering a buffer
let g:Tlist_Show_One_File = 1                                 " only show tags from active window
let g:Tlist_Sort_Type = "name"                                " tag sort order
let g:Tlist_Use_Right_Window = 1                              " put taglist window on the right
let g:Tlist_WinWidth = 60                                     " width of taglist window


" PATHOGEN:

call pathogen#infect()
call pathogen#helptags()


" SETTINGS:

" magic
filetype plugin on                                            " enable loading of plugins per filetype
syntax enable                                                 " activate syntax highlighting

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
set showcmd                                                   " show partial command and number of lines/columns selected
set tabstop=2                                                 " number of spaces a tab takes (displayed)
set tag=./.tags;,.venvtags                                    " tags file
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
set foldlevelstart=6                                          " open folds on open
set foldmethod=indent                                         " fold by indent
set foldminlines=0                                            " allow folding of single lines
set foldnestmax=5                                             " maximum fold level

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
set laststatus=2                                              " always show status line
set statusline=%<%F\ %h%m%r%{fugitive#statusline()}%=%l/%L    " status bar format

" spelling
set dictionary=/usr/share/dict/words                          " files where to load word for dictionary
set dictionary+=~/.vim/spell/custom-dictionary.utf-8.add      "   completion for use with <c-x><c-k>
set spellfile=~/.vim/spell/custom-dictionary.utf-8.add        " file where to add new dict words

" disabled
" syntax sync fromstart                                         " otherwise folding messes up highlighting


" COMMANDS AND FUNCTIONS:

" retab file using 2 spaces instead of 4 per tab
function! Retab ()
  set tabstop=4
  set noexpandtab
  %retab!
  set tabstop=2
  set expandtab
  %retab
endfunction

" refresh tags
" this function only does something if the taglist window is open
" this will also run ctags recursively if the file is in a git repository
function! RefreshTags ()
  if bufloaded('__Tag_List__')
    TlistUpdate
    if ! empty(finddir('.git'))
      call system('ctags -R --exclude=venv')
    else
      echo "Can't compile project tags, git repository not found in root"
    endif
  endif
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
function! s:AutoCompile ()
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

" Add mappings when opening quickfix window
" o opens file (<cr> is remapped to :)
" O previews file
" v opens file in vertical split
" V previews file in vertical split
" q closes quickfix window
function! s:OnOpenQuickfix ()
  exec "nnoremap <silent> <buffer> q :ccl<cr>"
  exec "nnoremap <silent> <buffer> o <cr>"
  exec "nnoremap <silent> <buffer> O <cr><c-w><c-j>"
  exec "nnoremap <silent> <buffer> v <c-w><cr>:ccl<cr><c-w>H:bo copen<cr><cr>"
  exec "nnoremap <silent> <buffer> V <c-w><cr>:ccl<cr><c-w>H:bo copen<cr>"
endfunction

" Ack command
" opens a quickfix window with the results
" simpler than ack.vim and isn't a ghetto grep hack
" any arguments to the command get passed through to command line ack
function! s:Ack (args)
  echo 'Acking...'
  if empty(a:args)
    let l:ack_args = expand("<cword>")
  else
    let l:ack_args = a:args
  end
  let l:ack_results = system('ack ' . l:ack_args)
  if strlen(l:ack_results)
    cgete l:ack_results
    botright copen
    redraw!
    echo line('$') . ' result(s) found'
  else
    redraw!
    echo 'No results found'
  endif
endfunction

command! -bang -nargs=* -complete=file Ack call s:Ack(<q-args>)


" AUTOCOMMANDS:

augroup general
  autocmd!
  autocmd   BufEnter      *             Rooter
  autocmd   CmdwinEnter   *             nnoremap <buffer> <cr> <cr>
  autocmd   FileType      *             set formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd   InsertEnter   *             set nocursorline
  autocmd   InsertLeave   *             set cursorline
  autocmd   WinEnter      *             set cursorline | set cursorcolumn
  autocmd   WinLeave      *             set nocursorline | set nocursorcolumn
augroup END

augroup quickfixgroup
  autocmd   FileType      qf            call s:OnOpenQuickfix()
augroup END

augroup nerdtreegroup
  autocmd!
  autocmd   FileType      nerdtree      noremap <buffer> <silent> <space> :nohlsearch<cr>
augroup END

augroup taglistgroup
  autocmd!
  autocmd   BufWritePost  *             call RefreshTags()
  autocmd   FileType      taglist       noremap <buffer> <silent> <leader>t <c-w>p
  autocmd   FileType      taglist       set nocursorline | set nocursorcolumn
augroup END

augroup pythongroup
  autocmd!
  autocmd   FileType      python        setlocal colorcolumn=80
  autocmd   FileType      python        setlocal omnifunc=pythoncomplete#Complete
augroup END

augroup coffeegroup
  autocmd!
  autocmd   BufWritePost  coffee        call s:AutoCompile()
  autocmd   FileType      coffee        setlocal colorcolumn=80
augroup END


" MAPPINGS:

" movements

" visual up, down, end of line, start of line (useful for long lines)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" easy movement around splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" easier indentation
vnoremap > >gv
vnoremap < <gv

" commands and searches

" remap enter to command line
nnoremap <cr> :
vnoremap <cr> :
" always use command line window otherwise
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i
nnoremap Q q:i
vnoremap : q:i
vnoremap / q/i
vnoremap ? q?i
vnoremap Q q:i
" don't move on * and #
nnoremap * *<c-o>
nnoremap # #<c-o>
" enable search for selected text, forwards (*) or backwards (#)
vnoremap <silent> * :<c-u>
  \let old_reg=getreg('"')<bar>let old_regtype=getregtype('"')<cr>
  \gvy/<c-r><c-r>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
  \gv:call setreg('"', old_reg, old_regtype)<cr><c-o>
vnoremap <silent> # :<c-u>
  \let old_reg=getreg('"')<bar>let old_regtype=getregtype('"')<cr>
  \gvy?<c-r><c-r>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
  \gv:call setreg('"', old_reg, old_regtype)<cr><c-o>

" misc

" changing background color
nnoremap <leader>bgd :set background=dark<cr>
nnoremap <leader>bgl :set background=light<cr>
" quickfix window
nnoremap <leader>co :botright copen<cr>
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cP :colder<cr>
nnoremap <leader>cN :cnewer<cr>
" toggle marks
nnoremap <leader>m :marks<cr>
" paste toggle
nnoremap <leader>pa :set paste!<cr>:set paste?<cr>
" toggle spell checking
nnoremap <leader>sp :set spell!<cr>
" toggle registers
nnoremap <leader>r :reg<cr>
" .vimrc sugar (open in new tab, source)
nnoremap <leader>ve :tabnew $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
" toggle search highlight off
nnoremap <silent> <space> :nohlsearch<cr>

" plugins

" ' is used for easymotion, replaced by ` mark travel
nnoremap ' <nop>
vnoremap ' <nop>
" toggle NERDtree
nnoremap <leader>f :NERDTreeToggle<cr>
" toggle taglist
nnoremap <leader>t :TlistHighlightTag<cr>:TlistOpen<cr>
nnoremap <leader>T :TlistToggle<cr><c-w>=<cr>
" fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>go :Gbrowse<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gP :Git pull<cr>

" file execution

" execute file using bash
nnoremap <leader>bb :%w !bash<cr>
" execute file using shell python
nnoremap <leader>pp :%w !python<cr>
" execute file using shell ipython or python and go in interactive mode, note that this saves the file first
nnoremap <leader>pi :w<cr>:!ipython -i %<cr>
nnoremap <leader>py :w<cr>:!python -i %<cr>
" run pylint on file (this saves the file first)
nnoremap <leader>pl :w<cr>:!pylint %<cr>
" execute selection using bash (no replacement)
vnoremap <leader>bb :w !bash<cr>
" execute selection with shell python (without replacing selection)
vnoremap <leader>pp :w !python<cr>


" ABBREVIATIONS:

iabbr MM Matthieu Monsch
iabbr #! #!/usr/bin/env
