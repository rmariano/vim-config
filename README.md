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
	$wget -O /tmp/deploy.sh https://raw.github.com/rmariano/vim-config/master/deploy.sh && sh /tmp/deploy.sh
```

## Automatic

Use the included [deploy.sh](deploy.sh) script which downloads and replaces the files on
their latest versions. Bear in mind that it requires ``wget`` which comes
installed in most of the distributions.

```bash
    $sh deploy.sh
```

Or

```bash
    $chmod +x deploy.sh
    $./deploy.sh
```


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

# Features

 * Mapping `<tab>` to `<Esc>` for faster access.
 * PEP-8 general rules of text: automatically handling spaces instead of tabs,
   proper indentation, wrap text to 79 columns, margin set at col 80
   (toggle-able), etc.
 * `<F2>` for toggling spell check.
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
 * Syntax highlighting for Docker files.
 * Can save files with `sudo` that were opened with less permissions: `:w!!` to `sudo` save the file.


# Other plug-ins I use

I prefer to keep the `.vimrc` configuration as simple as possible, however the
only exception so far is ``flake8``.

------

Enjoy!
