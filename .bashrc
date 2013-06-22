# .bashrc
# =======

# Env variables
# -------------

# General purpose, Homebrew and Node
export PATH=.:/usr/local/bin:/usr/local/share/npm/bin:$PATH

# Coloring for ls
# cf http://blog.imzaid.com/color-terminal-bash-on-the-mac-iterm-included
export LSCOLORS=exfxcxdxbxegedabagacad

# IPython
export IPYTHONDIR="$HOME/.config/ipython"

# Editor
export VISUAL='vim'

# Terminal prompt display
# Prompt indicates wall time (in seconds) of last command run along with
# color indicator of success or failure (blue for success and orange for
# failure)

# Disable virtualenv prompt (we show it differently)
VIRTUAL_ENV_DISABLE_PROMPT=1

function timer_start {
  TIMER=${TIMER:-$SECONDS}
}

function timer_stop {
  if [ -z "$VIRTUAL_ENV" ]; then
      VENV_PROMPT='';
    else
      VENV_PROMPT="(${VIRTUAL_ENV##*/}) ";
  fi;
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

export PS1='\n\[\e[${DOLLAR_COLOR}m\]${WALLTIME}\[\e[m\] \u@\h:\[\e[0;34m\]\w\[\e[m\]\n${VENV_PROMPT}\$ '

# Grep
export GREP_OPTIONS='--color=auto'

# MySQL
# PATH=$PATH:/usr/local/mysql/bin   # MySQL (not needed when using brew)
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Pylint
export PYLINTHOME="$HOME/.config/pylint"
export PYLINTRC="$HOME/.config/pylint/.pylintrc"

# Igloo
export IGLOO_PROFILES_PATH="$HOME/.config/igloo/config"
export IGLOO_DEFAULT_PROFILE='default'


# Aliases
# -------

alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
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
