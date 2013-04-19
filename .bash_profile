# .bash_profile
# =============

# Env variables
# -------------

PATH=.:$PATH                      # General purpose
PATH=$PATH:/usr/local/mysql/bin   # MySQL
export PATH

# Coloring for ls
# cf http://blog.imzaid.com/color-terminal-bash-on-the-mac-iterm-included
export LSCOLORS=gxfxcxdxbxegedabagacad

# Terminal prompt display
export PS1='[ \u@\h ] \[\e[0;36m\]\W\[\e[m\] \$ '

# MySQL python libraries import
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH


# Aliases
# -------

alias la='ls -AFG'
alias ll='ls -AFGl'
alias fl='python -m flasker'
alias t='python ~/.dotfiles/util/t/t.py --task-dir ~/Dropbox --list tasks'


# Functions
# ---------

function my_ip() # Get IP adress
{
    MY_IP=$(/sbin/ifconfig en1 | awk '/inet / { print $2 } ')
    echo ${MY_IP:-"Not connected"}
}

