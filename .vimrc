syntax enable
set nu

" COLORS:
set t_Co=256
set background=dark
colorscheme solarized
set hlsearch

" TEXT FORMATTING:
set textwidth=250
set wrap
set linebreak
set tabstop=2
set shiftwidth=2
set expandtab
set showbreak=>>\ \ 

" LATEX:
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
filetype indent on
" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" FOLDS: Autosave/load of folds
set foldcolumn=6
set foldmethod=indent
" Turned off because loading the views seems to mess up the settings
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" COMMANDS:
autocmd FileType python set colorcolumn=80|set tabstop=4|set shiftwidth=4

" ALIASES:
nnoremap <silent> <Space> :nohlsearch<CR>
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::gc<Left><Left><Left><Left>
noremap j gj
noremap k gk
noremap Q :set background=
