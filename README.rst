Configuration files
===================


Installation
------------

On a mac, using Homebrew_:

.. code:: bash

  $ curl -s -L https://raw.github.com/mtth/.dotfiles/master/bin/install.sh | bash -s

Otherwise:

.. code:: bash

  $ git clone https://github.com/mtth/.dotfiles.git
  $ .dotfiles/bin/link.sh
  $ .dotfiles/bin/submodules.sh


Utilities
---------

These will be installed (or updated) automatically if using the installer:

* *ack_*
* *ctags_*
* *git*
* python
* tmux
* vim

*Emphasis* indicates that some Vim plugins will fail if this utility is 
missing.


.. _ack: http://beyondgrep.com/
.. _ctags: http://ctags.sourceforge.net/ctags.html
.. _Homebrew: http://brew.sh/
