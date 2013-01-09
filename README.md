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
Download [libevent](http://libevent.org/) and [tmux](http://tmux.sourceforge.net/) and run in the directory of each download the following commands:

  $ ./configure
  $ sudo make
  $ sudo make install

### Install coffee-script, haml-coffee and stylus

Download [node.js](http://nodejs.org/) and install.

  $ sudo npm install -g coffee-script
  $ sudo npm install -g haml-coffee
  $ sudo npm install -g stylus

To autocompile one of those files, add a comment on the first line of the form AUTOCOMPILE <dest>.
