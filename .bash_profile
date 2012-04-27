PATH=.:/usr/local/mysql/bin:$PATH
export PATH
LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS

alias la='ls -AFG'
alias ll='ls -AFGl'

# Setting PATH for EPD-7.2-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}:/Users/Matt/Library/Python/"
export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS
