" VIM configuration file
"
" Standing on the shoulders of giants:
"   Learn Vimscript the Hard Way [http://learnvimscriptthehardway.stevelosh.com/]
"   The cleanest vimrc you will ever see [https://github.com/skwp/dotfiles/blob/master/vimrc]
"   The ultimate VIM configuration [http://amix.dk/VIM/vimrc.html]
"   Scrooloose's vimrc [https://github.com/scrooloose/vimfiles/blob/master/vimrc]
"   Bling's vimrc [https://github.com/bling/dotvim/blob/master/vimrc]
"
" Features inspirations from:
"   vim-rooter [https://github.com/airblade/vim-rooter]
"   unimpaired.vim [https://github.com/tpope/VIM-unimpaired]
"   ack.vim [https://github.com/mileszs/ack.vim]


filetype off                                                                    " safety
set nocompatible                                                                " one more time


" GLOBAL PLUGIN VARIABLES:

" Ctrlp
let g:ctrlp_by_filename = 1                                                     " search by filename by default
let g:ctrlp_cache_dir = $HOME . '/.vim/cache/ctrlp'                             " directory to store cached filepaths
let g:ctrlp_clear_cache_on_exit = 0                                             " retain cache between sessions (<F5> to clear manually)
let g:ctrlp_cmd = 'CtrlPMRU'                                                    " search mru files by default
let g:ctrlp_extensions = ['tag']                                                " add tag explorer
let g:ctrlp_lazy_update = 1                                                     " wait 250ms after typing before refreshing
let g:ctrlp_regexp = 0                                                          " use regexp as default search mode
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
let g:NERDTreeBookmarksFile = $HOME . '/.vim/cache/.nerdtree_bookmarks'         " where to store the NERDTree bookmarks
let g:NERDTreeIgnore = ['\.pyc$', '^\.DS_Store']                                " don't show these files
let g:NERDTreeQuitOnOpen = 1                                                    " quit VIM in nerdtree is the only buffer open
let g:NERDTreeShowBookmarks = 0                                                 " show bookmarks by default
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

" Solarized
let g:solarized_termtrans = 1                                                   " transparent background sometimes

" Taglist
let g:Tlist_Auto_Highlight_Tag = 1                                              " highlight active tag (after a small inactivity period)
let g:Tlist_Auto_Update = 1                                                     " process new files as they are opened
let g:Tlist_Compact_Format = 1                                                  " don't put line breaks between categories
let g:Tlist_Enable_Fold_Column = 0                                              " show fold column in taglist window
let g:Tlist_Exit_OnlyWindow = 1                                                 " quit VIM when taglist is the only window open
let g:Tlist_File_Fold_Auto_Close = 1                                            " automatically close folds corresponding to non active windows
let g:Tlist_GainFocus_On_ToggleOpen = 0                                         " move cursor to taglist window when opening it
let g:Tlist_Highlight_Tag_On_BufEnter = 1                                       " highlight active tag when entering a buffer
let g:Tlist_Show_One_File = 1                                                   " only show tags from active window
let g:Tlist_Sort_Type = "name"                                                  " tag sort order
let g:Tlist_Use_Right_Window = 1                                                " put taglist window on the right
let g:Tlist_WinWidth = 60                                                       " width of taglist window

" Miscellaneous
let g:project_root_markers = ['.git/', 'venv/']                                 " markers to find project root directory


" PATHOGEN:

call pathogen#infect()                                                          " load plugins
call pathogen#helptags()                                                        " generate help


" OPTIONS:

filetype plugin on                                                              " enable loading of plugins per filetype
syntax enable                                                                   " activate syntax highlighting

" general
set encoding=utf-8                                                              " en-coh-ding
set hidden                                                                      " allow hidden buffers
set lazyredraw                                                                  " don't redraw during macros, etc.
set magic                                                                       " use VIM magic regular expressions by default
set modelines=0                                                                 " read meta stuff from top or bottom of files
set noautochdir                                                                 " cwd is set differently (cf. s:smart_chdir function below)
set nostartofline                                                               " keeps cursor on current column for movements like H, M, ...
set number                                                                      " activate line numbers
set scrolloff=5                                                                 " allow 5 lines below/above the cursor
set shell=/bin/bash\ --rcfile\ ~/.bashrc                                        " load .bashrc when starting shell from VIM
set shellslash                                                                  " use forward slashes for paths, always
set showcmd                                                                     " show partial command and number of lines/columns selected
set tag=./.tags;,.venvtags                                                      " tags files
set ttimeoutlen=100                                                             " don't wait a second for wrong key codes to error out
set virtualedit=block                                                           " let cursor move past the last char in <C-V> mode

" text formatting
set autoindent                                                                  " keep indentation when going to new line
set backspace=indent,eol,start                                                  " allow backspace to delete new lines, etc.
set formatoptions+=nj                                                           " recognize lists when formatting and remove comment marker when joining
set linebreak                                                                   " wrap lines at break characters
set nojoinspaces                                                                " don't insert two spaces after punctuation on a join
set nosmartindent                                                               " don't add extra indents, ever
set textwidth=0                                                                 " don't insert line breaks for long lines
set wrap                                                                        " wrap long lines

" tabbing
set expandtab                                                                   " insert spaces instead of a tab when tabbing
set shiftwidth=2                                                                " spaces used for indent keys (>>, ...) and for autoindent
set tabstop=2                                                                   " number of spaces a tab takes (displayed)

" autocomplete
set completeopt=longest,menuone                                                 " only insert longest common strings of suggestions
set omnifunc=syntaxcomplete#Complete                                            " default omnicompletion using syntax keywords
set wildignore=*.swp,*.bak,*.pyc,*.class                                        " don't show these files in file autocompletion
set wildmenu                                                                    " allow autocompletion with c-n

" undohistory
set undodir=~/.vim/cache/undo                                                   " saves directory
set undofile                                                                    " allow persistence of undo history
set undolevels=1000                                                             " number of operations used
set undoreload=1000                                                             " number of operations stored

" folds
set fillchars="fold: "                                                          " don't show hyphens after folds
set foldcolumn=2                                                                " width of the fold column
set foldlevelstart=11                                                           " open all folds when opening new file
set foldmethod=indent                                                           " fold by indent
set foldminlines=0                                                              " allow folding of single lines
set foldnestmax=10                                                              " maximum fold level

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
set background=dark                                                             " theme
set colorcolumn=                                                                " don't highlight any columns by default
set nocursorcolumn                                                              " don't highlight the current column
set nocursorline                                                                " or the current row
set showbreak=>>\ \                                                             " characters shown after wrap linebreak
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
set spell                                                                       " turn spellcheck on by default
set spellfile=~/.vim/spell/custom-dictionary.utf-8.add                          " file where to add new dictionary words

" disabled
" syntax sync fromstart                                                         " otherwise folding messes up highlighting


" COMMANDS:

" Ack:
"   :Ack[!] [[OPTIONS] EXPR [FILE ...]]
"
"   Ack for matches of the regexp EXPR. If one or more FILE is specified,
"   only these files are searched, otherwise the entire project directory will
"   be explored. Any matches are loaded in the quickfix window. This
"   implementation is simpler than that of ack.vim
"   (https://github.com/mileszs/ack.vim), doesn't rely on monkey patching
"   the grep command, and highlights results in the quickfix window.
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
"   :Ack! hello                         Ack for hello in project directory
"                                       and open first match.
"   :Ack '\bthe\b' %                    Ack for occurences of the word
"                                       `the` in the current file.
"
command! -bang -nargs=* -complete=file Ack call <SID>ack(<bang>0, <q-args>)

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


" FUNCTIONS:

function! s:smart_indent()
  " matches indent of characters preceded by two or more whitespace characters
  " in the first non-empty line above
  let line_number = line('.')
  let line_content = ''
  while !strlen(line_content) && line_number >=# 1
    let line_number -= 1
    let line_content = getline(line_number)
  endwhile
  let line_content = line_content[col('.') - 1:]
  let offset = match(line_content, '\s\s\S')
  if offset >=# 0
    return repeat(' ', offset + 2)
  else
    return repeat(' ', &tabstop)
  endif
endfunction

function! s:get_project_root(markers)
  " get root of current project. markers corresponding to directories must end
  " with a /
  let dir_current_file = fnameescape(expand('%:p:h'))
  for marker in a:markers
    if match(marker, '/') !=# -1
      let marker_path = finddir(marker, dir_current_file . ';')
      if !empty(marker_path)
        return fnamemodify(marker_path, ':p:h:h')
      endif
    else
      let marker_path = findfile(marker, dir_current_file . ';')
      if !empty(marker_path)
        return fnamemodify(marker_path, ':p:h')
      endif
    endif
  endfor
  return ''
endfunction

function! s:smart_chdir()
  " set local working directory to project directory (marked by presence of
  " certain files) or to current file's directory. For special buffers, do
  " nothing.
  " copied from airblade/vim-rooter [https://github.com/airblade/vim-rooter]
  if match(expand('%:p'), '^\w\+://.*') !=# -1 || !empty(&buftype)
    " virtual file or special buffer
    return
  endif
  let project_root = s:get_project_root(g:project_root_markers)
  if !empty(project_root)
    execute ':lcd ' . fnameescape(project_root)
  else
    execute ':lcd ' . fnameescape(expand('%'))
  endif
endfunction

function! s:get_visual_selection()
  " get visual selection
  " copied from http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! s:open_in_previous_window(force, cmd)
  " a force command to load in previous window (cf. OpenInPreviousWindow command above for details)
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

function! s:refresh_tags(force)
  " (cf. RefreshTags command above for details)
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

function! s:retab(before, after) range
  " cf. Retab command for details
  let tabstop_save = &tabstop
  let &tabstop = str2nr(a:before)
  let range = a:firstline . ',' . a:lastline
  set noexpandtab
  execute range . 'retab!'
  let &tabstop = str2nr(a:after)
  set expandtab
  execute range . 'retab!'
  let &tabstop = tabstop_save
endfunction

function! s:autocompile()
  " autocompile coffeescript, haml, stylus on save using a comment on the first line
  " usage (coffee, stylus):
  " # AUTOCOMPILE destination
  " usage (haml):
  " # AUTOCOMPILE destination origin_directory
  " notes:
  " * destination path is relative to the current file's directory
  " * origin_folder is relative to VIM's current work directory
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

function! s:on_open_quickfix()
  " Customizing quickfix window
  setlocal nowrap
  setlocal statusline=%f%=%l/%L
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

function! s:resize_window(min_lines, max_lines)
  " resize window dynamically
  let total_lines = line('$')
  let height = min([a:max_lines, max([a:min_lines, total_lines])])
  execute "resize " . height
endfunction

function! s:ack(force, args)
  " cf. Ack command above for explanations
  cclose
  if strlen(a:args)
    let s:search_args = a:args
  endif
  if !exists('s:search_args')
    redraw!
    echo 'No search term found'
  else
    echo 'Searching...'
    let cmd = 'ack -H ' . s:search_args
    let l:results = system(cmd)
    if strlen(l:results)
      if a:force
        cexpr l:results
      else
        cgete l:results
      endif
      copen
      call matchadd('Search', '\v' . s:search_args)
      redraw!
      echo line('$') . ' result(s) found'
    else
      redraw!
      echo 'No results found'
    endif
  endif
endfunction

function! s:map_next_family(map,cmd)
  " previous and next mappings factory
  " copied from unimpaired.vim by tim pope, https://github.com/tpope/VIM-unimpaired/
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

function! s:toggle_paste(force) abort
  " also inspired by unimpaired.vim by tim pope, https://github.com/tpope/VIM-unimpaired/
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

function! s:create_snippet(open, ...) range
  " snippets
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

function! s:toggle_relativenumber(force)
  " toggle number/relativenumber (force = 0 to set number, force = 1 to set relativenumber)
  " note that if neither option is on, and force is different from 0 and 1, nothing will happen
  if a:force ==# 0 || &number
    set relativenumber
  elseif a:force ==# 1 || &relativenumber
    set number
  endif
endfunction

" buffer management
function! s:on_buf_enter()
  " buffer event handlers
  call s:smart_chdir()
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


" AUTOCOMMANDS:

" miscellaneous stuff
augroup generalgroup
  autocmd!
  autocmd   BufDelete                   *                   call <SID>on_buf_delete()
  autocmd   BufEnter                    *                   call <SID>on_buf_enter()
  autocmd   InsertLeave                 *                   call <SID>toggle_paste(0)
augroup END

" use the correct help program for VIM and tex files
augroup helpgroup
  autocmd!
  autocmd   FileType                    help                setlocal keywordprg=:help
  autocmd   FileType                    tex                 setlocal keywordprg=texdoc
  autocmd   FileType                    vim                 setlocal keywordprg=:help
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

" visual up, down
noremap j gj
noremap k gk
" easy movement around splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" not forgetting the previous window mapping
nnoremap <c-o> <c-w>p
" remap jumps
nnoremap <c-r> <c-i>
nnoremap <c-e> <c-o>
" and now undo
nnoremap U <c-r>
" ^ is hard to hit, also by symmetry with `g_` mapping
noremap _ ^
" move cursor in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
" mapping diff jumps, d makes more sense
nnoremap ]d ]c
nnoremap [d [c

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

" commands

" remap command line
nnoremap ; :
vnoremap ; :
" always use command line window otherwise
nnoremap : q:i
vnoremap : q:i

" miscellaneous

" redraw
nnoremap , <c-l>
" ' is used for easymotion, replaced by ` mark travel
nnoremap ' <nop>
vnoremap ' <nop>
" smart indentation
inoremap <expr> <s-tab> <SID>smart_indent()
" easier indentation in visual mode
vnoremap > >gv
vnoremap < <gv
" copying (consistency with C and D)
nnoremap Y y$
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
call s:map_next_family('t','t')

" plugins

" toggle NERDtree
nnoremap <leader>f :NERDTreeToggle<cr>
" toggle taglist
nnoremap <silent> <leader>t :TlistHighlightTag<cr>:TlistOpen<cr>
nnoremap <silent> <leader>T :CursorcrossOff<cr>:TlistToggle<cr><c-w>=:CursorcrossToggle<cr>
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

" VIM
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

" changes/fixes

" gundo avoid resize craziness
" fugitive bug fixes
" write virtualenv setter
" write search using lvim (Locate, see below)
" write plugin similar to [https://github.com/bling/vim-bufferline/blob/master/plugin/bufferline.vim] to display last search in command line
" look into formatoptions

" ideas

" Locate
" the search tool you never knew VIM had
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
