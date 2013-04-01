# .bash_profile

# Path appends
## General purpose
PATH=.:$PATH
## MySQL
PATH=/usr/local/mysql/bin:$PATH
## EPD-7.2-2
PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
## 
export PATH

# Coloring for ls
## Visit http://blog.imzaid.com/color-terminal-bash-on-the-mac-iterm-included
## for details on the colors for ls
LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS

# Aliases
alias la='ls -AFG'
alias ll='ls -AFGl'
alias fl='python -m flasker'
alias ta='python ~/.dotfiles/util/t/t.py --task-dir ~/Dropbox --list tasks'

# Terminal prompt display
PS1='[ \u@\h ] \[\e[0;36m\]\W\[\e[m\] \$ '
export PS1

# Other stuff
## EPD
MKL_NUM_THREADS=1
export MKL_NUM_THREADS
## MySQL python libraries import
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
