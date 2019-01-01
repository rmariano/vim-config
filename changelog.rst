Change Log
==========

v0.9 (2019-01-01)
-----------------
* Basic configuration support for Rust
* Multi-line comments for Python

0.8 (2018-09-08)
----------------
* Disable automatic fold
* README: update for ``set nosplitbelow``
* Run isort first, then formatting
* Fix background inside tmux
* Nicer highlighting for misspelled words
* Comments in blue
* Lighter background colour

v0.7 (2018-07-01)
-----------------
* Split horizontal windows, back to default.
* Fix python files with ``back``.
* Improve auto-formatting of Python files.


v0.6 (2017-11-01)
-----------------
* Documentation: corrections & formatting, describe new installation process,
  new functions, and mappings.
* Installation changed: ``deploy.sh`` removed and new Makefile instructions for
  local and remote installation support.
* Python syntax highlighting: extended support for ``Python 3.6``.
* New mapping: ``<F3>`` automatically corrects & formats the current file.
* Moves Python-specific configuration.
* ``deploy.sh`` deleted.
* Python: Highlight for ``__dict__``
* Remove trailing white spaces in all files upon saving (not just ``*.py``
  files).
* ``autowrite`` & ``autowriteall``.
* Removed double tab mapping (``<tab><tab>`` no longer equals ``<esc>``).

v0.5 (2017-03-18)
-----------------
* Makefile: Improved installation and more (deploy, install extras, etc.).
* CONTRIBUTING guidelines.
* Uses Python syntax highlighting from fork, with bespoke configuration.
* highlight all global in configuration.
* set highlight all for Python.
* PR template: For PRs.
* Documentation improvements:
  changelog moves to rst
  README improved and updated.
* checklist for PR templates & contributing guide.
* Ignore ``__pycache__`` from auto-completion (added besides \*.pyc files).
* 79 cols for all the things! (Not only Python).
* Install all extras in a package! (``make extras``, requires Vim 8.0+).
  Extras are: ``NERDTree``, ``fugiritve-vim``, and ``Flake8``.

v0.4 (2016-11-02)
-----------------
* Inform in the status bar when spell=on
* Remove deploy.sh from README
* Updated documentation
* Improvements in flake8 target
* Correct Makefile install target
* Replace the ``deploy.sh`` bash script for a ``Makefile``
* Remove custom support for markdown filetype
* Replace custom toggle paste function
* On Python, single line comment, leaves space
* Drop custom Dockerfile support
* set synmaxcol=120
* Set strict mode in deployment script.
* README.md: Correct installation one-liner
* deploy.sh: Change default branch to master

v0.3 (2016-02-28)
-----------------
* Set text width to 99, for Python files.
* Add mappings for managing tabs
* set autoindent & set smartindent
* silent error sounds.
* Performance improvements
* set scrolloff=10
* set hidden
* Configure splits

v0.2 (2015-10-11)
-----------------
* Do not enable the page limit bar by default.
* Toggle number with ``<leader>`` + ``e``
* Add support (syntax highlighting) for Dockerfile.
* set autoread
* Adding option to save files with sudo: ``:w!!``
* Extendeded color configuration for python.
