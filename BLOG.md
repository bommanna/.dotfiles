Stuff I learn
=============

5/23/2012
---------
I needed a way to remotely log in to my mac mini after a reboot. Sounds easy
but it was actually hard because my mini's IP would sometimes change and I 
would have no way to get it back without manually plugging my keyboard and
mouse into the computer and read it lacally.

The solution required three elements:

*   a way to dynamically update my IP from the mini. This is done by using
    a script called [ddclient](http://sourceforge.net/apps/trac/ddclient).
    I copied the script to `/usr/sbin` and then had to create two 
    directories and save a config file with spec from namecheap.

*   a way to run that update either automatically or at reboot. I ended up
    using cron via the crontab for root.

*   a way to start the computer without having to plug in a keyboard and
    mouse. This was done by going to the bluetooth panel in the settings
    of mac os and deactivating the automatic search for keyboard and mouse
    and start.

### Commands

    $ sudo mkdir /usr/sbin/                 # to store the ddclient script
    $ sudo mkdir /etc/ddclient              # to store the ddclient.conf file
    $ sudo mkdir /var/cache/ddclient        # to stare ddclient cache file
    $ sudo crontab -e                       # to edit root crontab

### .ddclient.conf

    protocol=namecheap
    use=if, if=en0
    server=dynamicdns.park-your-domain.com
    login=nncsts.com
    password=<password>
    @

### root crontab

    MAILTO=matt@nncsts.com
    * * * * * /usr/sbin/ddclient
