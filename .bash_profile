# .bash_profile

# Path appends
## General purpose
PATH=.:$PATH
## MySQL
PATH=/usr/local/mysql/bin:$PATH
## 
export PATH

# Coloring for ls
## cf http://blog.imzaid.com/color-terminal-bash-on-the-mac-iterm-included
export LSCOLORS=gxfxcxdxbxegedabagacad

# Aliases
alias la='ls -AFG'
alias ll='ls -AFGl'
alias fl='python -m flasker'
alias ta='python ~/.dotfiles/util/t/t.py --task-dir ~/Dropbox --list tasks'

# Terminal prompt display
export PS1='[ \u@\h ] \[\e[0;36m\]\W\[\e[m\] \$ '

# Other stuff
## MySQL python libraries import
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Get IP
function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

