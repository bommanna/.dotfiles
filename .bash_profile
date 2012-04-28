PATH=.:/usr/local/mysql/bin:$PATH
export PATH
LSCOLORS=gxfxxxdxbxegedabagacad
export LSCOLORS

alias la='ls -AFG'
alias ll='ls -AFGl'
alias va='. ~/Library/Python/venv/bin/activate'

# Setting PATH for EPD-7.2-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
export PATH

PYTHONPATH="Library/Python/:$PYTHONPATH"
export PYTHONPATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# For the Gurobi license
GRB_LICENSE_FILE="/Users/Matt/Library/Gurobi/gurobi.lic"
export GRB_LICENSE_FILE
