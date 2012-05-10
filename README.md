Configuration files
===================

List of files and folders tracked here:
---------------------------------------
* .bash\_profile
* .gitignore\_global
* .gitignore
* .gitconfig
* .inputrc
* .tmux.conf
* .vimperatorrc
* .vimrc
* .vim/ (except .vim/.netrwhist)

List of useful commands to run for setup
----------------------------------------
### In bash, to setup the hostname
    $ sudo scutil --set HostName <DesiredHostName>
### In VIM, to install latex-suite doc
    :helptags ~/.vim/doc
### Installing TMUX
Download libevent and tmux and run in the directory of each download the following commands:
    $ ./configure
    $ sudo make
    $ sudo make install
