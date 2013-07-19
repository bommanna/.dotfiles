" VIM configuration file
"
" Standing on the shoulders of giants:
"   Learn Vimscript the Hard Way [http://learnvimscriptthehardway.stevelosh.com/]
"   The cleanest vimrc you will ever see [https://github.com/skwp/dotfiles/blob/master/vimrc]
"   The ultimate Vim configuration [http://amix.dk/vim/vimrc.html]
"   Scrooloose's vimrc [https://github.com/scrooloose/vimfiles/blob/master/vimrc]
"   Bling's vimrc [https://github.com/bling/dotvim/blob/master/vimrc]
"
" Features inspirations from:
"   unimpaired.vim [https://github.com/tpope/vim-unimpaired]
"   scratch.vim [https://github.com/vim-scripts/scratch.vim]
"   ack.vim [https://github.com/mileszs/ack.vim]


filetype off                                                                    " safety
set nocompatible                                                                " one more time


" GLOBAL PLUGIN VARIABLES:

" Ctrlp
let g:ctrlp_by_filename = 1                                                     " search by filename by default
let g:ctrlp_cmd = 'CtrlPMRU'                                                    " search mru files by default
let g:ctrlp_user_command = 'ack %s -f'                                          " use ack as search index

" Cursorcross
let g:cursorcross_debug = 0                                                     " show messages to debug order of autocommands
let g:cursorcross_dynamic = 1                                                   " cursorline in normal mode, cursorcolumn in insert mode
let g:cursorcross_mappings = 1                                                  " create mappings

" EasyMotion
let g:EasyMotion_leader_key = "'"                                               " ' key is unbound in normal and visual mode below

" Gundo
let g:gundo_preview_height = 12                                                 " height of diff preview window
let g:gundo_width = 60                                                          " width of gundo window
let g:gundo_help = 0                                                            " show help
let g:gundo_preview_bottom = 1                                                  " use full width for diff preview window

" LatexBox
let g:LatexBox_autosave = 1                                                     " save before compiling
let g:LatexBox_Folding = 0                                                      " special folding for latex
let g:LatexBox_split_width = 60                                                 " width of table of contents
let g:LatexBox_async = 0                                                        " compile latex in background
let g:LatexBox_latexmk_preview_continuously = 0                                 " compile latex manually

" NerdTree
let g:NERDTreeIgnore = ['\.pyc$', '^\.DS_Store']                                " don't show these files
let g:NERDTreeQuitOnOpen = 1                                                    " quit vim in nerdtree is the only buffer open
let g:NERDTreeShowHidden = 1                                                    " show hidden files by default
let g:NERDTreeWinSize = 60                                                      " width of nerdtree window

" Python
let g:pymode_folding = 0                                                        " python folding
let g:pymode_lint = 0                                                           " load lint plugin for code checking
let g:pymode_lint_checker = ''                                                  " pyflakes,pep8,mccable,pylint
let g:pymode_motion = 0                                                         " python objects and motion
let g:pymode_rope = 0                                                           " load rope plugin for code refactoring
let g:pymode_run = 0                                                            " load run code plugin
let g:pymode_syntax = 0                                                         " pymode's custom syntax highlighting
let g:pymode_virtualenv = 1                                                     " switch to virtualenv pythonpath if in a virtualenv

" Rooter
let g:rooter_manual_only = 1                                                    " doing it below for all filetypes (otherwise only some activate rooting)
let g:rooter_patterns = ['.git/']                                               " patterns indicating root directory
let g:rooter_use_lcd = 1                                                        " use buffer local directory

" Solarized
let g:solarized_termtrans = 1                                                   " transparent background sometimes

" Taglist
let g:Tlist_Auto_Highlight_Tag = 1                                              " highlight active tag (after a small inactivity period)
let g:Tlist_Auto_Update = 1                                                     " process new files as they are opened
let g:Tlist_Compact_Format = 1                                                  " don't put line breaks between categories
let g:Tlist_Enable_Fold_Column = 0                                              " show fold column in taglist window
let g:Tlist_Exit_OnlyWindow = 1                                                 " quit vim when taglist is the only window open
let g:Tlist_File_Fold_Auto_Close = 1                                            " automatically close folds corresponding to non active windows
let g:Tlist_GainFocus_On_ToggleOpen = 0                                         " move cursor to taglist window when opening it
let g:Tlist_Highlight_Tag_On_BufEnter = 1                                       " highlight active tag when entering a buffer
let g:Tlist_Show_One_File = 1                                                   " only show tags from active window
let g:Tlist_Sort_Type = "name"                                                  " tag sort order
let g:Tlist_Use_Right_Window = 1                                                " put taglist window on the right
let g:Tlist_WinWidth = 60                                                       " width of taglist window

" Miscellaneous
let g:scratch_window_autohide = 1                                               " close scratch window when switching out
let g:scratch_window_height = 10                                                " height of scratch window
let g:search_executable = 'ack'                                                 " default could be 'egrep -n'
let g:search_highlight_matches = 1                                              " highlight search terms


" PATHOGEN:

call pathogen#infect()                                                          " load plugins
call pathogen#helptags()                                                        " generate help


" OPTIONS:

" magic
filetype plugin on                                                              " enable loading of plugins per filetype
syntax enable                                                                   " activate syntax highlighting

" general
set autoindent                                                                  " smarter indentation
set backspace=indent,eol,start                                                  " allow backspace to delete new lines, etc.
set encoding=utf-8                                                              " duh
set expandtab                                                                   " insert spaces instead of a tab when tabbing
set hidden                                                                      " allow hidden buffers
set lazyredraw                                                                  " don't redraw during macros, etc
set linebreak                                                                   " ? for latex
set magic                                                                       " use vim magic regular expressions by default
set modelines=0                                                                 " read meta stuff from top or bottom of files
set nojoinspaces                                                                " don't insert two spaces after punctuation on a join
set nostartofline                                                               " keeps cursor on current column for movements like H, M, ...
set noswapfile                                                                  " don't use swap files for saves
set number                                                                      " activate line numbers
set omnifunc=syntaxcomplete#Complete                                            " omnicompletion using syntax keywords
set scrolloff=5                                                                 " allow 5 lines below/above the cursor
set shell=/bin/bash\ --rcfile\ ~/.bashrc                                        " load .bashrc when starting shell from vim
set shellslash                                                                  " use forward slashes for paths, always
set shiftwidth=2                                                                " spaces used for indent keys (>>, ...) and for autoindent
set showcmd                                                                     " show partial command and number of lines/columns selected
set tabstop=2                                                                   " number of spaces a tab takes (displayed)
set tag=./.tags;,.venvtags                                                      " tags file
set textwidth=0                                                                 " don't insert line breaks for long lines
set ttimeoutlen=100                                                             " don't wait a second for wrong key codes to error out
set virtualedit=block                                                           " let cursor move past the last char in <C-V> mode
set wrap                                                                        " wrap long lines

" autocomplete
set completeopt=longest,menuone                                                 " only insert longest common strings of suggestions
set wildignore=*.swp,*.bak                                                      " don't show these files in autocompletion
set wildignore+=*.pyc,*.class                                                   " 
set wildmenu                                                                    " allow autocompletion with c-n

" undohistory
set undodir=~/.vim/cache/undo                                                   " saves directory
set undofile                                                                    " allow persistence of undo history
set undolevels=1000                                                             " number of operations used
set undoreload=1000                                                             " number of operations stored

" folds
set fillchars="fold: "                                                          " don't show hyphens after folds
set foldcolumn=2                                                                " width of the fold column
set foldlevelstart=6                                                            " open folds on open
set foldmethod=indent                                                           " fold by indent
set foldminlines=0                                                              " allow folding of single lines
set foldnestmax=5                                                               " maximum fold level

" search
set ignorecase                                                                  " if all lowercase in search query, ignore case
set incsearch                                                                   " highlight potential matches as search query is being typed
set nohlsearch                                                                  " don't highlight matches after executing search query
set smartcase                                                                   " if some uppercase in search query, respect case

" backups and swapfiles
set backup                                                                      " store existing files when overwriting
set backupdir=~/.vim/cache/backup                                               " store them here
set directory=~/.vim/cache/swap                                                 " we won't create swapfiles, but just in case
set noswapfile                                                                  " as we said, no swapfiles

" theme
colorscheme solarized                                                           " colorscheme
set background=dark                                                             " theme, autodetected
set colorcolumn=                                                                " don't highlight any columns
set nocursorcolumn                                                              " highlight the current column
set nocursorline                                                                " highlight the current row
set showbreak=>>\ \                                                             " characters shown on display linebreak
set t_Co=256                                                                    " terminal colors

" status line
set laststatus=2                                                                " always show status line
set statusline=%<                                                               " truncate on left if too long
set statusline+=%F\                                                             " full filepath
set statusline+=%{&modifiable?fugitive#statusline():''}                         " current git branch (if any and if buffer modifiable)
set statusline+=%r                                                              " readonly flag [RO]
set statusline+=%#StatusLineNC#                                                 " highlighting start
set statusline+=%y                                                              " filetype
set statusline+=%#ErrorMsg#                                                     " switch highlighting
set statusline+=%m                                                              " modified flag [+] (or [-] if nomodifiable is set)
set statusline+=%*                                                              " end highlighting
set statusline+=%=                                                              " switch to right side
set statusline+=%#StatusLineNC#                                                 " highlighting start
set statusline+=%{v:searchforward?'/':'?'}%{getreg('/')}                        " latest search along with direction
set statusline+=%*\                                                             " end highlighting
set statusline+=%c,%l/%L                                                        " current column, current line / total lines

" spelling
set dictionary=/usr/share/dict/words                                            " files where to load word for dictionary
set dictionary+=~/.vim/spell/custom-dictionary.utf-8.add                        "   completion for use with <c-x><c-k>
set spellfile=~/.vim/spell/custom-dictionary.utf-8.add                          " file where to add new dict words

" disabled
" syntax sync fromstart                                                         " otherwise folding messes up highlighting


" COMMANDS:

" Search:
"   :Search[!] [[OPTIONS] EXPR [FILE ...]]
"   :SearchBuffer[!] [[OPTIONS] EXPR]
"
"   Search for matches of the regexp EXPR. If one or more FILE is specified,
"   only these files are searched, otherwise the entire project directory will
"   be explored. Any matches are loaded in the quickfix window. This
"   implementation is simpler than that of ack.vim
"   (https://github.com/mileszs/ack.vim) and doesn't rely on monkey patching
"   the grep command.
"
" Arguments:
"   !                                   Load the first match.
"   OPTIONS, EXPR, FILE                 These arguments are forwarded to
"                                       the ack executable (along with the `-H`
"                                       flag to guarantee that the filename
"                                       is always present even when searching
"                                       inside a single file, otherwise the
"                                       quickfix window will fail). Cf.
"                                       `man ack` for details. Note that
"                                       special characters must be escaped or
"                                       quoted. If omitted, the previous ack
"                                       search will be repeated.
"
" Examples:
"   :Search! hello                      Search for hello in project directory
"                                       and open first match.
"   :SearchBuffer '\bthe\b'             Search for occurences of the word
"                                       `the` in the current file.
"
command! -bang -nargs=* -complete=file Search call <SID>search(<bang>0, 0, <q-args>)
command! -bang -nargs=* SearchBuffer call <SID>search(<bang>0, 1, <q-args>)

" OpenInPreviousWindow:
"   :OpenInPreviousWindow[!] COMMAND
"
"   This is useful in particular for quickfix (which otherwise always uses the
"   rightmost one) Note that the cursor in the window the command would have
"   loaded in will always be in the same position in the text but its position
"   relative to the window might be different.
"
" Arguments:
"   !                                   Force command to load in previous
"                                       window even if the cursor stays in the
"                                       current window.
"   COMMAND                             The command to execute.
"
command! -bang -nargs=* OpenInPreviousWindow call <SID>open_in_previous_window(<bang>0, <q-args>)

" RefreshTags:
"   :RefreshTags[!]
"
"   By default this command only does something if the taglist window is open.
"   If this is the case, it will update the taglist and run ctags recursively
"   if the file is in a git repository (and error out otherwise).
"
" Arguments:
"   !                                   Force tag refresh, even if the taglist
"                                       window isn't open.
"
command! -bang RefreshTags call <SID>refresh_tags(<bang>0)

" Retab:
"   :[RANGE]Retab BEFORE AFTER
"
"   This command will retab a file from BEFORE spaces per tab to AFTER spaces
"   per tab.
"
" Arguments:
"   RANGE                               Optional range to retab
"   BEFORE                              Initial number of spaces per tab
"   AFTER                               Desired number of spaces per tab
"
command! -range=% -nargs=* Retab <line1>,<line2>call <SID>retab(<f-args>)

" Snip:
"   :[RANGE]Snip[!]
"   :SnipRegister[!] REGISTER
"
"   Create a snippet using the `igloo` executable (requires igloo to be
"   installed: https://github.com/mtth/igloo). Configuration is done via two
"   global variables `g:snippets_ssh_url` and `g:snippets_http_url` or
"   environment variables `$SNIPPETS_SSH_URL` and `$SNIPPETS_HTTP_URL` (the
"   former take precedence). The http url is optional, to be able to open
"   snippets in the browser.
"
" Arguments:
"   !                                   Open snippet in browser (requires
"                                       the snippet HTTP URL to be set).
"   RANGE                               Optional line range to include in
"                                       snippet (defaults to the current
"                                       line).
"   REGISTER                            Register to send.
"
" Examples:
"   :Snip                               Creates a snippet with the contents of
"                                       the current line.
"   :'<,'>Snip                          Creates a snippet from the lines
"                                       currently selected and view it from
"                                       the browser.
"
command! -bang -range Snip <line1>,<line2>call <SID>create_snippet(<bang>0)
command! -bang -nargs=1 SnipRegister call <SID>create_snippet(<bang>0, <f-args>)

" Scratch:
"   :Scratch[!]
"
"   Open a scratch buffer in a full width window at the top of the screen.
"   This window is closed automatically when it is the last one left and
"   the buffer is deleted when VIM exits.
"
" Arguments:
"   !                                   Reset the scratch window (i.e.
"                                       empty any previous contents).
"
command! -bang -nargs=0 Scratch call <SID>open_scratch_buffer(<bang>0)


" FUNCTIONS:

" get visual selection
function! s:get_visual_selection()
  " copied from http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" force command to load in previous window (cf. OpenInPreviousWindow command above for details)
function! s:open_in_previous_window(force, cmd)
  let l:bwnr = winnr()
  let l:pwnr = winnr('#')
  execute a:cmd
  let l:cwnr = winnr()
  " we check if the cursor has moved window and if it isn't already in the correct one
  if (l:cwnr !=# l:bwnr || a:force) && l:cwnr !=# l:pwnr
    let l:cbnr = bufnr('%')
    let l:view = winsaveview()
    execute "normal! \<c-o>"
    execute l:pwnr . 'wincmd w'
    execute 'hide buf' l:cbnr
    call winrestview(l:view)
  endif
endfunction

" refresh tags (cf. RefreshTags command above for details)
function! s:refresh_tags(force)
  if bufloaded('__Tag_List__') || a:force
    TlistUpdate
    echomsg 'Taglist updated!'
    if !empty(finddir('.git'))
      call system('ctags -R --exclude=venv')
      echomsg 'Project tags updated!'
    else
      echomsg "Can't compile project tags, git repository not found in root."
    endif
  endif
endfunction

" retab (cf. Retab command for details)
function! s:retab(before, after) range
  let &tabstop = str2nr(a:before)
  let range = a:firstline . ',' . a:lastline
  set noexpandtab
  execute range . 'retab!'
  let &tabstop = str2nr(a:after)
  set expandtab
  execute range . 'retab!'
endfunction

" autocompile coffeescript, haml, stylus on save using a comment on the first line
function! s:autocompile()
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
      redraw
      if v:shell_error
        echo result
      else
        echo 'Compilation successful!'
      endif
    endif
  endif
endfunction

" buffer event handlers
function! s:on_buf_enter()
  execute "Rooter"
  if exists('b:autoclose') && b:autoclose
    if winbufnr(2) ==# -1
      if tabpagenr('$') ==# 1
        bdelete
        quit
      else
        close
      endif
    endif
  endif
endfunction

if !exists('s:buf_delete_handler')
  let s:buf_delete_handler = {}
endif

function! s:on_buf_delete(...)
  " usage
  " f(command[, buffer_number])
  if a:0 > 0
    " we are adding a handler
    if a:0 ==# 1
      let buf_nr = bufnr('%')
    else
      let buf_nr = a:2
    endif
    " note: key is coerced to string
    let s:buf_delete_handler[buf_nr] = a:1
  else
    " we are looking for a handler
    let buf_nr = expand('<abuf>')
    if has_key(s:buf_delete_handler, buf_nr)
      execute s:buf_delete_handler[buf_nr]
      unlet s:buf_delete_handler[buf_nr]
    endif
  endif
endfunction

" scratch buffer
function! s:open_scratch_buffer(reset)
  " edited version of http://www.vim.org/scripts/script.php?script_id=664
  " buffer is now always on top full width and autocloses
  let buffer_name = '__Scratch__'
  let scr_bufnum = bufnr(buffer_name)
  if scr_bufnum == -1
    execute 'new ' . buffer_name
    call s:on_open_scratch(g:scratch_window_height, 1)
  else
    let scr_winnum = bufwinnr(scr_bufnum)
    if scr_winnum != -1
      if winnr() != scr_winnum
        execute scr_winnum . "wincmd w"
      endif
    else
      execute "split +buffer" . scr_bufnum
      call s:on_open_scratch(g:scratch_window_height, 0)
    endif
    if a:reset
      silent execute '%d'
    endif
  endif
endfunction

function! s:on_open_scratch(height, fresh)
  execute 'wincmd K'
  execute 'resize ' . a:height
  if a:fresh
    let b:autoclose = 1
    setlocal bufhidden=hide
    setlocal buflisted
    setlocal buftype=nofile
    setlocal nonumber
    setlocal noswapfile
    setlocal winfixheight
    augroup scratch
      autocmd!
      if g:scratch_window_autohide
        autocmd BufLeave __Scratch__ close
      endif
    augroup end
  endif
endfunction

" Customizing quickfix window
function! s:on_open_quickfix()
  setlocal nowrap
  execute "wincmd J"
  call s:resize_window(1, 20)
  let b:autoclose = 1
  nnoremap <silent> <buffer> <cr> :OpenInPreviousWindow .cc<cr>
  nnoremap <silent> <buffer> O :OpenInPreviousWindow .cc<cr>zz:copen<cr>
  nnoremap <silent> <buffer> V <c-w><cr>:ccl<cr><c-w>H:copen<cr>
  nnoremap <silent> <buffer> o :OpenInPreviousWindow .cc<cr>
  nnoremap <silent> <buffer> q <c-w>p:ccl<cr>
  nnoremap <silent> <buffer> v <c-w><cr>:ccl<cr><c-w>H:copen<cr><c-w>p
endfunction

" resize window dynamically
function! s:resize_window(min_lines, max_lines)
  let total_lines = line('$')
  let height = min([a:max_lines, max([a:min_lines, total_lines])])
  execute "resize " . height
endfunction

" Search command (cf. Search command above for explanations)
function! s:search(force, buffer, args)
  cclose
  if strlen(a:args)
    let s:search_args = a:args
  endif
  if !exists('s:search_args')
    redraw!
    echo 'No search term found'
  else
    echo 'Searching...'
    if a:buffer
      if exists('g:search_highlight_matches') && g:search_highlight_matches
        let match_id = matchadd('Search', '\v' . s:search_args)
      endif
      let filepath = expand('%:p')
      let cmd = g:search_executable . " -H '" . s:search_args . "' " . filepath
    else
      let cmd = g:search_executable . ' ' . s:search_args
    endif
    let l:results = system(cmd)
    if strlen(l:results)
      if a:force
        cexpr l:results
      else
        cgete l:results
      endif
      copen
      call matchadd('Search', '\v' . s:search_args)
      " set the title (possible only after it has been opened)
      " redraw! will take care of showing the right one
      if a:buffer
        let w:quickfix_title = 'Search [' . filepath . '] ' . s:search_args
      else
        let w:quickfix_title = 'Search ' . s:search_args
      endif
      if exists('g:search_highlight_matches') && g:search_highlight_matches
        call s:on_buf_delete('execute "call matchdelete(' . match_id . ')"')
      endif
      redraw!
      echo line('$') . ' result(s) found'
    else
      redraw!
      echo 'No results found'
    endif
  endif
endfunction

" previous and next mappings factory
function! s:map_next_family(map,cmd)
  " copied from unimpaired.vim by tim pope, https://github.com/tpope/vim-unimpaired/
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

" paste toggling
function! s:toggle_paste(force) abort
  " also inspired by unimpaired.vim by tim pope, https://github.com/tpope/vim-unimpaired/
  if a:force
    let s:paste = &paste
    set paste
  else
    if exists('s:paste')
      let &paste = s:paste
      unlet s:paste
    endif
  endif
endfunction

" snippets
function! s:create_snippet(open, ...) range
  if exists('g:snippets_ssh_url')
    let ssh_url = g:snippets_ssh_url
  elseif exists('$SNIPPETS_SSH_URL')
    let ssh_url = $SNIPPETS_SSH_URL
  else
    echoerr 'No snippets SSH URL found!'
  endif
  if exists('g:snippets_http_url')
    let http_url = g:snippets_http_url
  elseif exists('$SNIPPETS_HTTP_URL')
    let http_url = $SNIPPETS_HTTP_URL
  else
    let http_url = ''
  endif
  " generate a pseudo-random hash
  let hash = system("cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32")
  if a:0 < 1
    " we are sending lines
    let cmd = a:firstline . ',' . a:lastline . 'w !igloo --stream'
    let cmd .= ' --url=' . ssh_url . ' ' . hash
    silent execute cmd
  else
    " we are sending a buffer
    let cmd = 'igloo --stream --url=' . ssh_url . ' ' . hash
    call system(cmd, substitute(getreg(a:1), '\n', '\n', 'g'))
    " (without the substitute, only the first line gets sent somehow)
  endif
  redraw!
  if v:shell_error == 0
    if !empty(http_url)
      echomsg 'Snippet created! ' . http_url . hash
      if a:open
        call system('open http://' . http_url . hash)
      endif
    else
      echomsg 'Snippet' hash 'created!'
      if a:open
        echoerr 'No snippets HTTP URL found!'
      endif
    endif
  else
    call system('igloo --version')
    if v:shell_error > 0
      echoerr 'Igloo command line utility missing'
    else
      echoerr 'Something went wrong!'
    endif
  endif
endfunction

" toggle number/relativenumber
function! s:toggle_relativenumber(force)
  if a:force ==# 0 || &number
    set relativenumber
  elseif a:force ==# 1 || &relativenumber
    set number
  endif
endfunction


" AUTOCOMMANDS:

" miscellaneous stuff
augroup generalgroup
  autocmd!
  autocmd   BufDelete                   *                   call <SID>on_buf_delete()
  autocmd   BufEnter                    *                   call <SID>on_buf_enter()
  autocmd   FileType                    *                   set formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd   InsertLeave                 *                   call <SID>toggle_paste(0)
augroup END

" use the correct help program for vim and tex files
augroup helpgroup
  autocmd!
  autocmd   FileType                    help                setlocal keywordprg=:help
  autocmd   FileType                    vim                 setlocal keywordprg=:help
  autocmd   FileType                    tex                 setlocal keywordprg=texdoc
augroup END

" change quickfix window keybindings and make it full width
augroup quickfixgroup
  autocmd!
  autocmd   FileType                    qf                  call <SID>on_open_quickfix()
augroup END

" some commands when using the taglist window
augroup taglistgroup
  autocmd!
  autocmd   BufWritePost                *                   silent RefreshTags
augroup END

" language specific thangs
augroup texgroup
  autocmd!
  autocmd   FileType                    tex                 noremap <buffer> <leader>ll :w<cr>:Latexmk<cr>
augroup END
augroup pythongroup
  autocmd!
  autocmd   FileType                    python              setlocal colorcolumn=80
  autocmd   FileType                    python              setlocal omnifunc=pythoncomplete#Complete
augroup END
augroup coffeegroup
  autocmd!
  autocmd   BufWritePost                *                   call <SID>autocompile()
  autocmd   FileType                    coffee              setlocal colorcolumn=80
augroup END


" MAPPINGS:
" 
" movements

" visual up, down, end of line, start of line (useful for long lines)
noremap j gj
noremap k gk
" easy movement around splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" not forgetting the previous window mapping
nnoremap <c-n> <c-w>p
" easier indentation
vnoremap > >gv
vnoremap < <gv
" ^ is hard to hit, also by symmetry with `g_` mapping
noremap _ ^
" fixing <c-i> jump (same as <tab> for vim)
nnoremap <c-e> <c-i>
" fixing diff jumps
nnoremap ]d ]c
nnoremap [d [c
" move cursor in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
" list and quick go to buffer
nnoremap gb :ls<cr>:e #

" commands

" remap command line
nnoremap ; :
vnoremap ; :
" always use command line window otherwise
nnoremap : q:i
vnoremap : q:i

" searches

" repeating search
nnoremap <tab> ;
nnoremap <s-tab> ,
" toggle search highlight
nnoremap <space> :set nohlsearch!<cr>:set hlsearch?<cr>
" enable search for selected text, forwards (*) or backwards (#)
vnoremap <silent> * :<c-u>
  \let old_reg=getreg('"')<bar>let old_regtype=getregtype('"')<cr>
  \gvy/<c-r>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
  \:call setreg('"', old_reg, old_regtype)<cr>
vnoremap <silent> # :<c-u>
  \let old_reg=getreg('"')<bar>let old_regtype=getregtype('"')<cr>
  \gvy?<c-r>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
  \:call setreg('"', old_reg, old_regtype)<cr>

" misc

" copying (consistency with C and D)
nnoremap Y y$
" redraw
nnoremap , <c-l>
" toggle line numbers
nnoremap <silent> Q :call <SID>toggle_relativenumber(-1)<cr>
" changing background color
nnoremap <leader>bgd :set background=dark<cr>
nnoremap <leader>bgl :set background=light<cr>
" quickfix window
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>co :copen<cr>
" toggle messages
nnoremap <leader>M :messages<cr>
" toggle marks
nnoremap <leader>m :marks<cr>
" toggle registers
nnoremap <leader>r :registers<cr>
" toggle scratch window
nnoremap gS :Scratch!<cr>
nnoremap gs :Scratch<cr>
" pasting (inspired by unimpaired.vim, cf. above)
nnoremap <silent> ya  :call <SID>toggle_paste(1)<CR>a
nnoremap <silent> yi  :call <SID>toggle_paste(1)<CR>i
nnoremap <silent> yo  :call <SID>toggle_paste(1)<CR>o
nnoremap <silent> yO  :call <SID>toggle_paste(1)<CR>O
nnoremap <silent> yA  :call <SID>toggle_paste(1)<CR>A
nnoremap <silent> yI  :call <SID>toggle_paste(1)<CR>I
" more unimpaired mappings
call s:map_next_family('a','')
call s:map_next_family('b','b')
call s:map_next_family('c','c')
call s:map_next_family('l','l')
call s:map_next_family('t','tab')

" plugins

" ' is used for easymotion, replaced by ` mark travel
nnoremap ' <nop>
vnoremap ' <nop>
" toggle NERDtree
nnoremap <leader>f :NERDTreeToggle<cr>
" toggle taglist
nnoremap <leader>t :TlistHighlightTag<cr>:TlistOpen<cr>
nnoremap <leader>T :CursorcrossOff<cr>:TlistToggle<cr><c-w>=:CursorcrossToggle<cr>
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
" toggle Gundo
nnoremap <leader>u :GundoToggle<cr>

" languages

" vim
" open .vimrc
nnoremap <leader>ve :tabnew $MYVIMRC<cr>
"source .vimrc
nnoremap <leader>vs :source $MYVIMRC<cr>

" bash
" execute file
nnoremap <leader>bb :%w !bash<cr>
" execute selection using bash (no replacement)
vnoremap <leader>bb :w !bash<cr>

" python
" set filetype
nnoremap <leader>pf :set filetype=python<cr>
" execute file using shell python
nnoremap <leader>pp :%w !python<cr>
" execute file using shell ipython or python and go in interactive mode, note that this saves the file first
nnoremap <leader>pi :w<cr>:!ipython -i %<cr>
nnoremap <leader>py :w<cr>:!python -i %<cr>
" run pylint on file (this saves the file first)
nnoremap <leader>pl :w<cr>:!pylint %<cr>
" execute selection with shell python (without replacing selection)
vnoremap <leader>pp :w !python<cr>


" ABBREVIATIONS:

iabbr MM Matthieu Monsch
iabbr #! #!/usr/bin/env


" FUTURE:

" fixes

" gundo avoid resize craziness
" fugitive bug fixes
" rewrite rooter
" write virtualenv setter
" fix ack to be used normally (not for searching buffer)
" write search using lvim (Locate)
" create mappings gs/gS for scratch (for your convenience remap sleep to gZzZz) and which in visual mode appends (or replaces if gS) the lines to the scratch buffer

" Locate ideas
" the search tool you never knew vim had
" vimgrep on steroids
" use dictionary-functions for when closing location window (or use python bindings)
" Mapping
" gl: locate selection (or same as previous if no selection)
" gL: locate prompt (if nothing inputed, use last general search pattern)
" Commands
" Lo[cate][!] [PATTERN]
" Options
" height = [5, 20] (min, max height of location window)
" highlight = 1 (highlight matches in window)
" jump = 0 (automatically jump to first match when using mapping)
" verymagic = 0 (automatically add verymagic flag to prompted pattern)
" refresh = 0 (automatically refresh location list when buffer changes)


" function ideas

" execute command without moving cursor in window
" doesn't work currently (doesn't do anything)
" function! s:run_in_place(cmd)
"   let l:view = winsaveview()
"   " silent execute 'normal! ' . a:cmd
"   silent execute a:cmd
"   " call winrestview(l:view)
"   " redraw!
" endfunction
" command! -nargs=* RunInPlace call <SID>run_in_place(<q-args>)

" snip to pbcopy (using reattach-to-namespace if $TMUX)
" unclear how to do over ssh
