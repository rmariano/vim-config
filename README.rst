Vim Configuration
=================

.. image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: LICENSE
   :alt: MIT license

This is an ongoing project of that sets up
a particular configuration for improved productivity.

The goal is to develop a good configuration for the Vim editor, tailored
for Python development.

It does not change the behaviour of VIM, since this configuration only
adds comfortable shortcuts, and settings that are recommended for
software development (coding good practices).


.. contents ::


Installation
------------

Instant
^^^^^^^

Copy and paste the following command in your terminal:

.. code:: bash

    mkdir -p ~/.vim && wget -O ~/.vim/Makefile -N https://raw.github.com/rmariano/vim-config/master/Makefile && make -C ~/.vim install


Automatic
^^^^^^^^^

Use the included `Makefile <Makefile>`_ script which downloads and replaces the
files on their latest versions. Bear in mind that requires ``wget`` and
``Makefile`` which comes installed in most of the distributions.

.. code:: bash

    make install

Or, if you want to install a particular version (tag or branch).

.. code:: bash

    make install BRANCH=<tag_or_branch>

Note: this is supported from version ``>=v0.4``.

The previous methods rely on getting the files from the Internet, but
alternatively, if you have already downloaded the project, and unpacked it
somewhere in your file system, you can install it by running:

.. code:: bash

    make deploy

That will copy the files to their respective locations. Note that this will
replace any previous instances of those file you might have had there. If you
want to start over, you could simply run ``make clean``, which will remove the
files for this project (not the extra packages, though).


Features
--------

* `PEP-8 <https://www.python.org/dev/peps/pep-0008/>`_ general rules of text:
  automatically handling spaces instead of tabs, proper indentation, wrap text
  to 79 columns, margin set (toggle-able), etc.

* ``<leader>`` + ``tw`` will highlight trailing white spaces.

* ``<leader>`` + ``w`` will remove them (they'll also be automatically removed
  when saving :-)

* ``autoindent`` & ``smartindent``.

* Function keys

  * ``<F2>``: toggle spell check.
  * ``<F3>``: Correct files automatically
    * For XML with correct the formatting
    * Python files: auto-PEP-8, correct imports, and run ``flake8`` checks.
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
  * ``<leader>`` + ``to``:  **T**\ab **O**\nly, close all tabs but the current one.
  * ``<leader>`` + ``tc``:  **T**\ab **C**\lose, close current tab.
  * ``<leader>`` + ``tm``:  **T**\ab **M**\ove, current to the end.

* Window splits properly configured

  * New vertical splits, to the right
  * New horizontal splits, below.

  * ``<C-j>``: for moving between splits (instead of ``<C-W><C-j>``).
    Same for ``h``, ``k``, or ``l`` respectively.

* Other features

  * ``scrolloff=10``: offset of 10 lines when scrolling
  * Performance improvements
  * Silent bells
  * Set hidden buffers

Colour scheme
-------------

The colour scheme requires the terminal to support 256 colours. Most of the
terminals already support this, but some terminal multiplexers like ``tmux``
might require to be run as: ``tmux -2`` in order to support this.

In addition, just the command-line classic Vim version is supported, so no
support for ``Gvim`` or graphical versions is included for the colour scheme,
although pull requests are welcomed.

Captures
^^^^^^^^

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


Contributing
------------

If you want to try the project, and tweak the settings, I would recommend you
to clone the repository, and use the development deployment, which creates
symlinks of the files in this project, like:

.. code:: bash

    make dev-deploy

In addition, take a moment to read the contributing guidelines.

Dependencies
------------

* Vim 7.4+
* Linux (Other platforms are supported on a best-effort basis).


External plug-ins
^^^^^^^^^^^^^^^^^

I prefer to keep the ``.vimrc`` configuration as simple as possible, so this
project is a collection of settings, configurations, and helpers. That
maintains the Vim installation as general as possible.

However, on a daily basis, we might want some extra, few plug-ins.

These are `flake8 <https://github.com/nvie/vim-flake8>`_,
`fugitive vim <https://github.com/tpope/vim-fugitive>`_, and
`NERDTree <https://github.com/scrooloose/nerdtree>`_.

**Please note**: The installation of the extra dependencies requires ``Vim
8.0`` or newer, since it install the external projects as packages.

They can be installed with:

.. code:: bash

    make extras


Enjoy!
