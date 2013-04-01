Configuration files
===================

Install
-------

.. code:: bash

  $ git clone git@github.com:mtth/.dotfiles.git
  $ git submodule update --init
  $ make

``make`` creates the symlinks to the home directory. Any preexisting dotfiles
will be renamed by appending ``.old``.


Misc
----

Installing TMUX
***************

Download libevent_ and tmux_ and run in the directory of each download the following commands:

.. code:: bash

  $ ./configure
  $ sudo make
  $ sudo make install


Install coffee-script, haml-coffee and stylus
*********************************************

Download node.js_ and run:

.. code:: bash

  $ sudo npm install -g coffee-script
  $ sudo npm install -g haml-coffee
  $ sudo npm install -g stylus

To autocompile one of those files, add a comment on the first line of the form AUTOCOMPILE <dest>.


Setup the hostname
******************

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
    login=nncsts.com
    password=<password>
    @

root crontab::

    MAILTO=matt@nncsts.com
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
