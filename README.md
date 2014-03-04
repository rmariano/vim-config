Vim-Config Plug-in
==========

Vim configuration.
This is an ongoing project of developing Plug-ins for Vim and setting
a particular configuration for improved productivity.

The goal is to develop a good configuration for the Vim editor, tailored
for Python development.

##Installation

For setting this configuration, you should copy the configuration files to
the Vim directory, or create symlinks if you want to update the configuration
by git.

    cp .vimrc ~/.vimrc

If there are any color-schemes you would like to install, I suggest to copy
them to ~/.vim/colors (create the directory if it does not exist).
Again, configuration can be made by copying the files or by creating symlinks.


    cp \<colorscheme\>.vim ~/.vim/colors

## Color scheme Plug-in
The color scheme requires the terminal to support 256 colors. Most of the
terminals already support this, but some terminal multiplexers like `tmux`
might require to be run as: `tmux -2` in order to support this.

In addition, just the command-line classic Vim version is supported, so no
support for Gvim or graphical versions is included for the color scheme although
pull requests are accepted.

------

Enjoy!
