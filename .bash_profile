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

# Color grep results
export GREP_OPTIONS='--color=auto'

# MySQL python libraries import
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH


# Aliases
# -------

alias la='ls -AFG'
alias ll='ls -AFGl'
alias fl='python -m flasker'
alias t='python ~/.dotfiles/util/t/t.py --task-dir ~/Dropbox --list tasks'


# Functions
# ---------

my_ip(){
  MY_IP=$(/sbin/ifconfig en1 | awk '/inet / { print $2 } ')
  echo ${MY_IP:-"Not connected"}
}

# find all extensions in a directory, with counts
# percent sign is because of vim undo files
extensions(){
  REGEXP='^.+[^/%]\.([^/.]+)$'
  find $1 | sed -nE "s:${REGEXP}:\1:p" | sort | uniq -c | sort
}
