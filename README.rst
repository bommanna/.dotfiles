Configuration files
===================


Installation
------------

.. code:: bash

  $ git clone https://github.com/mtth/.dotfiles.git
  $ cd .dotfiles
  $ make install

This will create symbolic links to all tracked dotfiles in your home directory. Any files that would be overwritten are saved in the ``.save/`` directory. To restore these, simply run ``make uninstall``.


Recommended packages
--------------------

Homebrew_ is the supported way to install these packages. Below is the preferred instal order. Otherwise, for example, there might be issues of VIM linking with the system python instead of the brew installed python.  They can be installed in one command by running ``make brew``.

* git (should already be installed)
* tmux
* ctags
* python
* vim
* ack

The following packages are optional but potentially useful:

* node (optional: only if editing coffee script)
* reattach-to-user-namespace (optional: to enable pbcopy and pbpaste in tmux)


Miscellaneous
-------------

Setting up the hostname
***********************

.. code:: bash

  $ sudo scutil --set HostName <DesiredHostName>


Dynamic DNS for headless Mac
****************************

This solution requires three elements:

*   a way to dynamically update the IP. This is done by using
    a script called ddclient_. First, copy the script to `/usr/sbin`
    and create two directories and save a config file with spec
    from your webhost (namecheap, etc.).

*   a way to run that update either automatically or at reboot. Here we give
    an example using cron via the crontab for root.

*   a way to start the computer without having to plug in a keyboard and
    mouse. This was done by going to the bluetooth panel in the settings
    of mac os and deactivating the automatic search for keyboard and mouse
    and start.

Commands::

    $ sudo mkdir /usr/sbin/                 # to store the ddclient script
    $ sudo mkdir /etc/ddclient              # to store the ddclient.conf file
    $ sudo mkdir /var/cache/ddclient        # to store ddclient cache file
    $ sudo crontab -e                       # to edit root crontab

.ddclient.conf::

    protocol=namecheap
    use=if, if=en0
    server=dynamicdns.park-your-domain.com
    login=<domain>
    password=<password>
    @

root crontab::

    MAILTO=<email>
    * * * * * /usr/sbin/ddclient


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
