Configuration files
===================


Installation
------------

.. code:: bash

  $ git clone https://github.com/mtth/.dotfiles.git
  $ cd .dotfiles
  $ make install

This will create symbolic links to all tracked dotfiles in your home 
directory. Any files that would be overwritten are saved in the ``.save/`` 
directory. To restore these, simply run ``make uninstall``.


Recommended packages
--------------------

Homebrew_ is the supported way to install these packages. Below is the 
preferred instal order. Otherwise, for example, there might be issues of Vim 
linking with the system python instead of the brew installed python.  They can 
be installed in one command by running ``make brew``.

* git (should already be installed)
* tmux
* ctags
* python
* vim
* ack

The following packages are optional but potentially useful:

* node
* reattach-to-user-namespace (to enable pbcopy and pbpaste in tmux)


Extra personal settings
-----------------------

The following files can be used to add untracked personal settings:

* ``$HOME/.config/extra/.bashrc``: if this file exists, it will also be sourced 
  by bash on startup.
* ``$HOME/.config/extra/.vimperatorrc``: if this file exists, it will also be 
  sourced by vimperator on startup.


.. _ddclient: http://sourceforge.net/apps/trac/ddclient
.. _pathogen: https://github.com/tpope/vim-pathogen
.. _vimtags: #
.. _pyflakes: #
.. _MacVim: #
.. _CTags: #
.. _libevent: http://libevent.org/
.. _tmux: http://tmux.sourceforge.net/
.. _node.js: http://nodejs.org/
.. _Homebrew: http://mxcl.github.io/homebrew/
