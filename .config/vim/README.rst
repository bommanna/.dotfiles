Vim configuration directory
===========================

* ``autoload``: should only contain pathogen_
* ``bundle``: pathogen managed plugins (split into colorschemes and others)
* ``cache``: this directory contains information cached to disk by Vim 
  plugins. Each subdirectory should contain a file named ``.gitignore`` with 
  the following contents:

  .. code::

     *
     !.gitignore

* ``ftplugin``: filetype specific files to source (e.g. ``python.vim`` will be 
  sourced for buffers of filetype ``python``)
* ``spell``: custom dictionaries (where new words are added)

.. _pathogen: https://github.com/tpope/vim-pathogen
