" SAFETY:

filetype off

set whichwrap

" GLOBAL PLUGIN VARIABLES:

" Ctrlp
let g:ctrlp_by_filename = 1                                   " search by filename by default
let g:ctrlp_cmd = 'CtrlPMRU'                                  " search mru files by default
let g:ctrlp_user_command = 'ack %s -f'                        " use ack as search index

" EasyMotion
let g:EasyMotion_leader_key = "'"                             " ' key is unbound in normal and visual mode below

" LatexBox
let g:LatexBox_autosave = 1                                   " save before compiling
let g:LatexBox_Folding = 0                                    " special folding for latex
let g:LatexBox_split_width = 60                               " width of table of contents
let g:LatexBox_async = 0                                      " compile latex in background

" NerdTree
let g:NERDTreeIgnore = ['\.pyc$', '^\.DS_Store']              " don't show these files
let g:NERDTreeQuitOnOpen = 1                                  " quit vim in nerdtree is the only buffer open
let g:NERDTreeShowHidden = 1                                  " show hidden files by default
let g:NERDTreeWinSize = 60                                    " width of nerdtree window

" Python
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
let g:rooter_patterns = ['.git/']                             " patterns indicating root directory
let g:rooter_use_lcd = 1                                      " use buffer local directory

" Solarized
let g:solarized_termtrans = 1                                 " transparent background sometimes

" Taglist
let g:Tlist_Auto_Highlight_Tag = 1                            " highlight active tag (after a small inactivity period)
let g:Tlist_Auto_Update = 1                                   " process new files as they are opened
let g:Tlist_Compact_Format = 1                                " don't put line breaks between categories
let g:Tlist_Enable_Fold_Column = 0                            " show fold column in taglist window
let g:Tlist_Exit_OnlyWindow = 1                               " quit vim when taglist is the only window open
let g:Tlist_File_Fold_Auto_Close = 1                          " automatically close folds corresponding to non active windows
let g:Tlist_GainFocus_On_ToggleOpen = 0                       " move cursor to taglist window when opening it
let g:Tlist_Highlight_Tag_On_BufEnter = 1                     " highlight active tag when entering a buffer
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
set magic                                                     " use vim magic regular expressions by default
set nojoinspaces                                              " don't insert two spaces after punctuation on a join
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
set ttimeoutlen=100                                           " don't wait a second for wrong key codes to error out
set virtualedit=block                                         " let cursor move past the last char in <C-V> mode
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


" FUNCTIONS:

" retab file using 2 spaces instead of 4 per tab
function! s:Retab ()
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
function! s:RefreshTags ()
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
  setlocal nocursorline
  execute "wincmd J"
  execute "command! -buffer OpenInPreviousWindow call s:OpenInPreviousWindow('.cc')"
  execute "nnoremap <silent> <buffer> O :OpenInPreviousWindow<cr>zz:copen<cr>"
  execute "nnoremap <silent> <buffer> V <c-w><cr>:ccl<cr><c-w>H:copen<cr>"
  execute "nnoremap <silent> <buffer> j j"
  execute "nnoremap <silent> <buffer> k k"
  execute "nnoremap <silent> <buffer> o :OpenInPreviousWindow<cr>"
  execute "nnoremap <silent> <buffer> q :ccl<cr>"
  execute "nnoremap <silent> <buffer> v <c-w><cr>:ccl<cr><c-w>H:copen<cr><c-w>p"
endfunction

" activate cursorline and cursorcolumn only if buffer is modifiable
function! s:CursorCross ()
  if &modifiable
    set cursorline
    set cursorcolumn
  else
    set nocursorline
    set nocursorcolumn
  endif
endfunction

" Ack command
" opens a quickfix window with the results
" simpler than ack.vim (https://github.com/mileszs/ack.vim) and isn't a ghetto grep hack
" any arguments to the command get passed through to command line ack
function! s:Ack (force, args)
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
    if a:force
      .cc
    endif
    redraw!
    echo line('$') . ' result(s) found'
  else
    redraw!
    echo 'No results found'
  endif
endfunction

" previous and next mappings
" copied from unimpaired.vim by tim pope (https://github.com/tpope/vim-unimpaired/)
" didn't like that quickfix was remapped to q
function! s:MapNextFamily(map,cmd)
  let map = '<Plug>unimpaired'.toupper(a:map)
  let end = ' ".(v:count ? v:count : "")<CR>'
  execute 'nnoremap <silent> '.map.'Previous :<C-U>exe "'.a:cmd.'previous'.end
  execute 'nnoremap <silent> '.map.'Next     :<C-U>exe "'.a:cmd.'next'.end
  execute 'nnoremap <silent> '.map.'First    :<C-U>exe "'.a:cmd.'first'.end
  execute 'nnoremap <silent> '.map.'Last     :<C-U>exe "'.a:cmd.'last'.end
  execute 'nmap <silent> ['.        a:map .' '.map.'Previous'
  execute 'nmap <silent> ]'.        a:map .' '.map.'Next'
  execute 'nmap <silent> ['.toupper(a:map).' '.map.'First'
  execute 'nmap <silent> ]'.toupper(a:map).' '.map.'Last'
  if exists(':'.a:cmd.'nfile')
    execute 'nnoremap <silent> '.map.'PFile :<C-U>exe "'.a:cmd.'pfile'.end
    execute 'nnoremap <silent> '.map.'NFile :<C-U>exe "'.a:cmd.'nfile'.end
    execute 'nmap <silent> [<C-'.a:map.'> '.map.'PFile'
    execute 'nmap <silent> ]<C-'.a:map.'> '.map.'NFile'
  endif
endfunction

call s:MapNextFamily('a','')
call s:MapNextFamily('b','b')
call s:MapNextFamily('c','c')
call s:MapNextFamily('l','l')
call s:MapNextFamily('t','t')

" paste toggling
" also copied from unimpaired.vim by tim pope (https://github.com/tpope/vim-unimpaired/)
function! s:setup_paste() abort
  let s:paste = &paste
  set paste
endfunction

nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   unlet s:paste |
        \ endif
augroup END

" force command to load in previous window
" useful in particular for quickfix (which otherwise always uses the rightmost one)
" nb: the cursor in the window the command would have loaded in will be in the
" same position in the text but its position relative to the window might be
" different
function! s:OpenInPreviousWindow (cmd)
  let l:pwnr = winnr('#')
  execute a:cmd
  let l:cwnr = winnr()
  if l:cwnr !=# l:pwnr
    let l:cbnr = bufnr('%')
    let l:view = winsaveview()
    execute "normal! \<c-o>"
    execute l:pwnr . 'wincmd w'
    execute 'hide buf' l:cbnr
    call winrestview(l:view)
  endif
endfunction


" COMMANDS AND AUTOCOMMANDS:

" some commands
command! -bang -nargs=* -complete=file  Ack     call s:Ack(<bang>0, <q-args> . ' -H')
command!                                Retab   call s:Retab()

" miscellaneous stuff
augroup generalgroup
  autocmd!
  autocmd   BufEnter      *             Rooter
  autocmd   CmdwinEnter   *             nnoremap <buffer> <cr> <cr>
  autocmd   FileType      *             set formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd   InsertEnter   *             set nocursorline
  autocmd   InsertLeave   *             set cursorline
  autocmd   WinEnter      *             call s:CursorCross()
  autocmd   WinLeave      *             set nocursorline | set nocursorcolumn
augroup END

" use the correct help program for vim and tex files
augroup helpgroup
  autocmd!
  autocmd   FileType      help          setlocal keywordprg=:help
  autocmd   FileType      vim           setlocal keywordprg=:help
  autocmd   FileType      tex           setlocal keywordprg=texdoc
augroup END

" change quickfix window keybindings and make it full width
augroup quickfixgroup
  autocmd   FileType      qf            call s:OnOpenQuickfix()
augroup END

" some commands when using the taglist window
augroup taglistgroup
  autocmd!
  autocmd   BufWritePost  *             call s:RefreshTags()
  autocmd   FileType      taglist       noremap <buffer> <silent> <leader>t <c-w>p
  autocmd   FileType      taglist       set nocursorline | set nocursorcolumn
augroup END

" language specific thangs
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
" ^ is hard to hit
nnoremap _ ^
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
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>
" toggle marks
nnoremap <leader>m :marks<cr>
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
nnoremap <leader>gL :silent Glog --<cr>:copen<cr>:redraw!<cr>
nnoremap <leader>gP :Git pull<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :silent Glog<cr>:copen<cr>:redraw!<cr>
nnoremap <leader>go :Gbrowse<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>

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
