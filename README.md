# Vim Configuration

[![MIT license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](LICENSE)

This is an ongoing project that sets up a particular configuration for improved productivity.

The goal is to develop a good configuration for the Vim editor, tailored for Python development.

It does not change the behavior of VIM, since this configuration only adds comfortable shortcuts, and settings that are recommended for software development (coding good practices).

## Table of Contents

- [Installation](#installation)
- [Features](#features)
- [Color scheme](#color-scheme)
- [Contributing](#contributing)
- [Dependencies](#dependencies)

## Installation

## NeoVim support
For Neovim, follow these steps:
1. Install [plug](https://github.com/junegunn/vim-plug)
2. `cp init.vim ~/.config/nvim/`  (create dir as necessary)

Remaining installation instructions should work.

### Instant

Copy and paste the following command in your terminal:

```bash
mkdir -p ~/.vim && wget -O ~/.vim/Makefile -N https://raw.github.com/rmariano/vim-config/master/Makefile && make -C ~/.vim install
```

### Automatic

Use the included [Makefile](Makefile) script which downloads and replaces the files on their latest versions. Bear in mind that requires `wget` and `Makefile` which comes installed in most of the distributions.

```bash
make install
```

Or, if you want to install a particular version (tag or branch).

```bash
make install BRANCH=<tag_or_branch>
```

> **Note:** This is supported from version `>=v0.4`.

The previous methods rely on getting the files from the Internet, but alternatively, if you have already downloaded the project, and unpacked it somewhere in your file system, you can install it by running:

```bash
make deploy
```

That will copy the files to their respective locations. Note that this will replace any previous instances of those file you might have had there. If you want to start over, you could simply run `make clean`, which will remove the files for this project (not the extra packages, though).

## Features

The leader key (`<leader>`) can be customized, but it's mapped to `-` by default.

- `<leader>` + `j`: Toggle the margin at the column number set by `textwidth`.

- `<leader>` + `tw` will highlight trailing white spaces.

- `<leader>` + `w` will remove them (they'll also be automatically removed when saving :-).

- `autoindent` & `smartindent`.

- `<leader>` + `c` Will *comment* out lines of code, and `<leader>` + `u` will *uncomment* them out. Both apply to normal and visual modes.

- Function keys
  - `<F2>`: toggle spell check.
  - `<F3>`: Correct files automatically
    - XML: auto-format & indent.
    - Python: PEP-8, sort imports, format with black, and run `flake8` checks.
  - `<F4>`: toggle paste mode.
  - `<F7>`: Run checks in the file (currently only Python is supported).

- `<leader>` + `nh` as a shortcut for `:nohlsearch` (No highlight).

- A color scheme I like.

- Customizations for certain file types: Python, YAML, XML, and more to come over time.

- A status line with useful information (file name with path, modification flag, file type, column, lines, and position (in %).

- `;t` available for searching development tags, such as `TODO` or `FIXME`, rendering the results in a quick fix window. Warning: searches recursively.

- `<leader>` + `n`, `<leader>` + `p` for moving to the *next* and *previous* entries in the quick-fix window, respectively. `<leader>` + `q` for closing it.

- `<leader>` + `e` to toggle line numbers (enabled by default).

- Can save files with `sudo` that were opened with less permissions: `:w!!` to `sudo` save the file.

- Mappings for managing tabs
  - `<leader>` + `tn`: **T**ab **N**ew, opens a new tab to the right.
  - `<leader>` + `to`: **T**ab **O**nly, close all tabs but the current one.
  - `<leader>` + `tc`: **T**ab **C**lose, close current tab.
  - `<leader>` + `tm`: **T**ab **M**ove, current to the end.

- Window splits properly configured
  - New vertical splits, to the right
  - `<C-j>`: for moving between splits (instead of `<C-W><C-j>`). Same for `h`, `k`, or `l` respectively.

- `Ctrl` + `C`: Copy selected content to clipboard.

- Other features
  - `scrolloff=10`: offset of 10 lines when scrolling
  - Performance improvements
  - Silent bells
  - Set hidden buffers

## Color scheme

The color scheme requires the terminal to support 256 colors. Most of the terminals already support this, but some terminal multiplexers like `tmux` might require to be run as: `tmux -2` in order to support this.

In addition, just the command-line classic Vim version is supported, so no support for `Gvim` or graphical versions is included for the color scheme, although pull requests are welcomed.

### Captures

Here are some examples of how the color scheme looks like.

![Vim capture 1](https://rmariano.github.io/itarch/vim-capture1.png)

Please note this might depend on the configuration of your terminal as well.

![Vim capture 2](https://rmariano.github.io/itarch/vim-capture2.png)

## Contributing

If you want to try the project, and tweak the settings, I would recommend you to clone the repository, and use the development deployment, which creates symlinks of the files in this project, like:

```bash
make dev-deploy
```

In addition, take a moment to read the contributing guidelines.

## Dependencies

- Vim 8+
- Linux, OSX (Other platforms are supported on a best-effort basis).

### External plug-ins

I prefer to keep the `.vimrc` configuration as simple as possible, so this project is a collection of settings, configurations, and helpers. That maintains the Vim installation as general as possible.

However, on a daily basis, we might want some extra, few plug-ins.

These are [flake8](https://github.com/nvie/vim-flake8), [fugitive vim](https://github.com/tpope/vim-fugitive), and [NERDTree](https://github.com/scrooloose/nerdtree).

**Please note**: The installation of the extra dependencies requires `Vim 8.0` or newer, since it install the external projects as packages.

They can be installed with:

```bash
make extras
```

---

Enjoy!
