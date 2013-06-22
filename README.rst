Configuration files
===================

Install
-------

.. code:: bash

  $ git clone git@github.com:mtth/.dotfiles.git
  $ make

``make`` creates the symlinks to the home directory. Any preexisting dotfiles
will be renamed by appending ``.old``.


Package requirements
--------------------

Homebrew_ is the recommended way to install these packages. Below is the preferred instal order. Otherwise, for example, there might be issues of VIM linking with the system python instead of the brew installed python.

* git
* tmux
* ctags
* python
* vim
* node (optional: only if editing coffee script)


Misc
----

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

Future directions
-----------------

* Python script to replace Makefile and better handle old file backup (e.g. storing them in a specific directory and having a command to reinstall them, uninstall-kind).


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
