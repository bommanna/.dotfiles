" PATHOGEN:
call pathogen#infect()
call pathogen#helptags()

" GENERAL:
syntax enable
set nu
set showtabline=2
set wildignore=*.swp,*.bak,*.pyc,*.class
set noswapfile

" COLORS:
set t_Co=256
set background=dark
colorscheme solarized
set hlsearch

" CURSOR:
set cursorcolumn
set cursorline

" TEXT FORMATTING:
set textwidth=0
set wrap
set linebreak
set tabstop=2
set shiftwidth=2
set expandtab
set showbreak=>>\ \ 
set colorcolumn=80

" LATEX:
" To install, run the following command in VIM after downloading the files"
" :helptags ~/.vim/doc
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" This enables automatic indentation as you type.
" filetype indent on
" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" FOLDS: Autosave/load of folds
set foldcolumn=2
set foldmethod=indent

" VIEWS: Turned off because loading the views seems to mess up the settings
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" MARKDOWN: Turned off (if it's on, markdown highlighting doesn't work!)
" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd

" FILETYPE AUTOCOMMANDS: Turned off because 4 is back to default tabstop
" autocmd FileType python set tabstop=4|set shiftwidth=4
" autocmd FileType mkd set tabstop=4|set shiftwidth=4

" HTML:
au BufRead,BufNewFile *.html   set filetype=html
autocmd FileType html set tabstop=1|set shiftwidth=1|set colorcolumn=0
" HAML:
au BufRead,BufNewFile *.haml   set filetype=haml
autocmd FileType haml set colorcolumn=0
" STYLUS:
au BufRead,BufNewFile *.styl   set filetype=stylus
autocmd FileType css set colorcolumn=0

function! AutoCompileCoffee ()
    ! coffee -o ../js -c %
    echo '.coffee file autocompiled!'
endfunction

function! AutoCompileHAML ()
    ! haml-coffee -i . -o ../js/jst.js
    echo '.haml files autocompiled!'
endfunction

function! AutoCompileStyl ()
    ! stylus . --out ../css
    echo '.styl files autocompiled!'
endfunction

autocmd     BufWritePost     *.coffee     :call AutoCompileCoffee()
autocmd     BufWritePost     *.haml     :call AutoCompileHAML()
autocmd     BufWritePost     *.styl     :call AutoCompileStyl()

" GENERAL AUTOCOMMANDS:

au InsertEnter  *   :set nocursorline
au InsertLeave  *   :set cursorline

" OTHER HELPERS:

function! Retab ()
    set tabstop=4
    set noexpandtab
    %retab!
    set tabstop=2
    set expandtab
    %retab
endfunction

" ALIASES:
nnoremap <silent> <Space> :nohlsearch<CR>
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::gc<Left><Left><Left><Left>
noremap j gj
noremap k gk
noremap Q :set background=
