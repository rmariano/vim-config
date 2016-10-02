# Vim Configuration
-------------------

[![License](http://img.shields.io/license/MIT.png?color=green)](http://opensource.org/licenses/MIT)


Vim configuration.
This is an ongoing project of developing Plug-ins for Vim and setting
a particular configuration for improved productivity.

The goal is to develop a good configuration for the Vim editor, tailored
for Python development.

# Installation

## Instant

Copy and paste the following command in your terminal:

```bash
	wget -O /tmp/Makefile -N https://raw.github.com/rmariano/vim-config/master/Makefile && cd /tmp && make && cd -
```

## Automatic

Use the included [Makefile](Makefile) script which downloads and replaces the files on
their latest versions. Bear in mind that requires ``wget`` and ``Makefile`` which comes
installed in most of the distributions.

```bash
    $sh deploy.sh
```

Or, if you want to install a particular version (tag or branch).

```bash
    $ make install BRANCH=<tag_or_branch>
```

Note: this is supported from version >=0.4.

## Manual Installation

For setting this configuration, you should copy the configuration files to
the Vim directory, or create symlinks if you want to update the configuration
by git.

```bash
    cp .vimrc ~/.vimrc
```

If there are any colour schemes you would like to install, I suggest to copy
them to ~/.vim/colors (create the directory if it does not exist).
Again, configuration can be made by copying the files or by creating symlinks.


```bash
    cp colors/<colorscheme>.vim ~/.vim/colors/
```

# Colour scheme Plug-in

The colour scheme requires the terminal to support 256 colours. Most of the
terminals already support this, but some terminal multiplexers like `tmux`
might require to be run as: ``tmux -2`` in order to support this.

In addition, just the command-line classic Vim version is supported, so no
support for ``Gvim`` or graphical versions is included for the colour scheme
although pull requests are accepted.

## Captures

Here are some examples of how the colour scheme looks like:
![Vim capture 1](http://rmariano.github.io/itarch/vim-capture1.png)

Please note this might depend on the configuration of your terminal as well.

![Vim capture 2](http://rmariano.github.io/itarch/vim-capture2.png)

## Development

If you want to try the project, and tweak the settings, I would recommend to clone the repository,
and use the development deployment, which creates symlinks of the files in this project, like:

    make dev-deploy


# Features

 * Mapping `<tab>` to `<Esc>` for faster access.
 * PEP-8 general rules of text: automatically handling spaces instead of tabs,
   proper indentation, wrap text to 79 columns, margin set at col 99 (toggle-able), etc.

   * autoindent & smartindent

 * Function keys
    * `<F2>`: toggle spell check.
    * `<F3>`: auto indent/format files (currently only XML support).
    * `<F4>`: toggle paste mode

 * ``<leader>`` +  ``nh`` as a shortcut for ``:nohlsearch``
 * `<leader>` + `p` is mapped to toggle paste mode, with the label indicating
   in the status bar if is active or not.
 * A colour scheme I like.
 * A status line with useful information (file name with path, modification
   flag, file type, column, lines, and position (in %).
 * `;t` available for searching development tags, such as `TODO` or `FIXME`,
   rendering the results in a quick fix window. Warning: searches recursively.
 * `<leader>n`, `<leader>p` for moving to the next and previous entries in the
   quick-fix window, respectively. `<leader>q` for closing it.
 * `<leader>e` to toggle line numbers (enabled by default).
 * Can save files with `sudo` that were opened with less permissions: `:w!!` to `sudo` save the file.
 * Mappings for managing tabs
    * `<leader>tn`:  tabnew
    * `<leader>to`:  tabonly (close all tabs but this)
    * `<leader>tc`:  tabclose
    * `<leader>tm`:  tabmove

* Window Splits properly configured
	* New vertical splits, to the right
	* New horizontal splits, below.
	* `<C-j>` for moving between splits (instead of `<C-W><C-j>`). Same for `h`, `k`, or `l` respectively.

* Other features
    * scrolloff=10
    * Performance improvements
    * Silent bells
    * Set hidden buffers

# Other plug-ins I use

I prefer to keep the `.vimrc` configuration as simple as possible, so this project is a collection of settings,
configurations, and helpers. That maintains the Vim installation as general as possible.

However, on a daily basis, we might want some extra, few plugins. Some exceptions could be ``flake8``, ``fugitive``, etc.

They can be installed with:

    make extras

------

Enjoy!
