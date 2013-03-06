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

Stuff I learn
--

5/23/2012
**

I needed a way to remotely log in to my mac mini after a reboot. Sounds easy
but it was actually hard because my mini's IP would sometimes change and I 
would have no way to get it back without manually plugging my keyboard and
mouse into the computer and read it lacally.

The solution required three elements:

*   a way to dynamically update my IP from the mini. This is done by using
    a script called ddclient_.
    I copied the script to `/usr/sbin` and then had to create two 
    directories and save a config file with spec from namecheap.

*   a way to run that update either automatically or at reboot. I ended up
    using cron via the crontab for root.

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

6/1/2012
**

I recently learned about the sphinx_ documentation tool and
started using it. The autodoc module allows it to pull doctrings automatically
from python modules, classes and methods. So far, it seems like a great, the 
only downside is that it uses rst as markup scheme instead of md. I am using it
for the Amzn documentation and soon will organize the ouragan documentation
with it.

It can be used to output to pdf but the main usage seems to be creating html
docs. There are several templates available too (although *scrolls*, one of the
nicer ones, seems to not function correctly at this time unfortunately). This 
is particularly useful coupled with the following python command::

    $ python -m SimpleHTTPServer

This lets you run a simple httpserver from the current working directory (the
default port is 8080 is believe) accessible from everywhere. Just put the
documentation html files there and you are all set!

.. _sphinx: http://sphinx.pocoo.org/

6/2/2012
**

I cleaned up my `.vim` directory today. First of all, I installed pathogen_
to keep installed plugins organized. It's pretty great and allows for a very
clean plugin separation. The only catch is that plugin directories (in the 
`bundle` folder) need to have the correct plugin name or they won't work. I 
haven't figured out yet how to find that name reliably.

I then tested out a few plugins: vimtags_ and pyflakes_. However I finally 
decided to go against them because their use didn't make up for the
inconvience of installing lots of dependencies (MacVim_ for pyflakes and 
CTags_ for vimtags). 

.. _pathogen: https://github.com/tpope/vim-pathogen
.. _vimtags: #
.. _pyflakes: #
.. _MacVim: #
.. _CTags: #
