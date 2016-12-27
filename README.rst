-----------------
Vim Configuration
-----------------

.. image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: license
   :alt: MIT license

This is an ongoing project of that sets up
a particular configuration for improved productivity.

The goal is to develop a good configuration for the Vim editor, tailored
for Python development.

It does not change the behaviour of VIM, since this configuration only
adds comfortable shortcuts, and settings that are recommended for
sofware development (coding good practices).


Installation
------------

Instant
-------

Copy and paste the following command in your terminal::

	wget -O /tmp/Makefile -N https://raw.github.com/rmariano/vim-config/master/Makefile && cd /tmp && make && cd -

Automatic
---------

Use the included :download:`Makefile <Makefile>`_ script which downloads and replaces the
files on their latest versions. Bear in mind that requires ``wget`` and
``Makefile`` which comes installed in most of the distributions.

.. code:: bash

    make install

Or, if you want to install a particular version (tag or branch).

.. code:: bash

    make install BRANCH=<tag_or_branch>

Note: this is supported from version ``>=v0.4``.

Manual Installation
-------------------

For setting this configuration, you should copy the configuration files to
the Vim directory, or create symlinks if you want to update the configuration
by git.

.. code:: bash

    cp .vimrc ~/.vimrc

If there are any colour schemes you would like to install, I suggest to copy
them to ~/.vim/colors (create the directory if it does not exist).
Again, configuration can be made by copying the files or by creating symlinks.

.. code:: bash

    cp colors/<colorscheme>.vim ~/.vim/colors/


Colour scheme
-------------

The colour scheme requires the terminal to support 256 colours. Most of the
terminals already support this, but some terminal multiplexers like ``tmux``
might require to be run as: ``tmux -2`` in order to support this.

In addition, just the command-line classic Vim version is supported, so no
support for ``Gvim`` or graphical versions is included for the colour scheme,
although pull requests are accepted.

Captures
--------

Here are some examples of how the colour scheme looks like.

.. image:: https://rmariano.github.io/itarch/vim-capture1.png
   :target: https://rmariano.github.io/itarch/vim-capture1.png
   :width: 883px
   :height: 391px
   :alt: Vim capture 1
   :align: center

Please note this might depend on the configuration of your terminal as well.

.. image:: https://rmariano.github.io/itarch/vim-capture2.png
   :target: https://rmariano.github.io/itarch/vim-capture2.png
   :width: 574px
   :height: 596px
   :alt: Vim capture 2
   :align: center


Development
-----------

If you want to try the project, and tweak the settings, I would recommend to
clone the repository, and use the development deployment, which creates
symlinks of the files in this project, like:

.. code:: bash

    make dev-deploy


Features
--------

* Mapping double ``<tab>`` to ``<Esc>`` for faster access.

* `PEP-8 <https://www.python.org/dev/peps/pep-0008/>`_ general rules of text:
  automatically handling spaces instead of tabs, proper indentation, wrap text
  to 79 columns, margin set (toggle-able), etc.

* ``autoindent`` & ``smartindent``.

* Function keys

    * ``<F2>``: toggle spell check.
    * ``<F3>``: auto indent/format files (currently only XML support).
    * ``<F4>``: toggle paste mode

* ``<leader>`` +  ``nh`` as a shortcut for ``:nohlsearch``
* ``<leader>`` + ``p`` is mapped to toggle paste mode, with the label
  indicating in the status bar if is active or not.

* A colour scheme I like.

* A status line with useful information (file name with path, modification
  flag, file type, column, lines, and position (in %).

* ``;t`` available for searching development tags, such as ``TODO`` or
  ``FIXME``, rendering the results in a quick fix window. Warning: searches
  recursively.

* ``<leader>`` + ``n``, ``<leader>`` + ``p`` for moving to the next and
  previous entries in the quick-fix window, respectively. ``<leader>`` + ``q``
  for closing it.

* ``<leader>`` + ``e`` to toggle line numbers (enabled by default).

* Can save files with ``sudo`` that were opened with less permissions: ``:w!!``
  to ``sudo`` save the file.

* Mappings for managing tabs

    * ``<leader>`` + ``tn``:  **T**\ab **N**\ew, opens a new tab to the right.
    * ``<leader>`` + ``to``:  **T**\ab **o**\nly, close all tabs but the current one.
    * ``<leader>`` + ``tc``:  **T**\ab **c**\lose, close current tab.
    * ``<leader>`` + ``tm``:  **T**\ab **m**\ove, current to the end.

* Window Splits properly configured

    * New vertical splits, to the right
    * New horizontal splits, below.

    * ``<C-j>``: for moving between splits (instead of ``<C-W><C-j>``).
      Same for ``h``, ``k``, or ``l`` respectively.

* Other features

    * ``scrolloff=10``: offset of 10 lines when scrolling
    * Performance improvements
    * Silent bells
    * Set hidden buffers


External plug-ins
-----------------

I prefer to keep the ``.vimrc`` configuration as simple as possible, so this
project is a collection of settings, configurations, and helpers. That
maintains the Vim installation as general as possible.

However, on a daily basis, we might want some extra, few plugins. Some
exceptions could be ``flake8``, ``fugitive``, etc.

They can be installed with:

.. code:: bash

    make extras


Enjoy!
