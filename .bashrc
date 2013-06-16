# .bashrc
# =======

# Env variables
# -------------

PATH=.:/usr/local/bin:$PATH                        # General purpose
# PATH=$PATH:/usr/local/mysql/bin   # MySQL (not needed when using brew)
export PATH

# Coloring for ls
# cf http://blog.imzaid.com/color-terminal-bash-on-the-mac-iterm-included

export LSCOLORS=exfxcxdxbxegedabagacad

# Terminal prompt display
# Prompt indicates wall time (in seconds) of last command run along with
# color indicator of success or failure (blue for success and orange for
# failure)

function timer_start {
  TIMER=${TIMER:-$SECONDS}
}

function timer_stop {
  if [ $? = 0 ]; then
    DOLLAR_COLOR="0;34";
  else
    DOLLAR_COLOR="0;33";
  fi;
  WALLTIME=$(($SECONDS - $TIMER))
  unset TIMER
}

trap 'timer_start' DEBUG
PROMPT_COMMAND='timer_stop'

export PS1='\n\[\e[${DOLLAR_COLOR}m\]${WALLTIME}\[\e[m\] \u@\h:\[\e[0;34m\]\w\[\e[m\]\n\$ '

# Color grep results
export GREP_OPTIONS='--color=auto'

# MySQL python libraries import
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH


# Aliases
# -------

alias la='ls -AFG'
alias ll='ls -AFGl'


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