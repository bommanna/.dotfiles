# .bash_profile

# Path appends
## General purpose
PATH=.:$PATH:/Users/Matt/Library/Python
## MySQL
PATH=/usr/local/mysql/bin:$PATH
## Macports
PATH=/opt/local/bin:/opt/local/sbin:$PATH
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
alias nn='ssh nncsts.com'

# Terminal prompt display
PS1='[ \u@\h ] \[\e[0;36m\]\W\[\e[m\] \$ '
export PS1

# Other stuff
## EPD
MKL_NUM_THREADS=1
export MKL_NUM_THREADS
## Gurobi license location
GRB_LICENSE_FILE="/Users/Matt/Library/Gurobi/gurobi.lic"
export GRB_LICENSE_FILE
