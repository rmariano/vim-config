Vim-config
==========

Vim configuration.
This is an ongoing project of developing plugins for vim and setting
a particular configuration for improved productivity.

The goal is to develop a good configuration for the vim editor, tailored
for Python development.

##Instalation

For setting this configuration, you should copy the configuration files to
the vim directory, or create symlinks if you want to update the configuration
by git.

    cp .vimrc ~/.vimrc

If there are any colorschemes you would like to install, I suggest to copy
them to ~/.vim/colors (create the directory if it does not exist).
Again, configuration can be made by copying the files or by creating symlinks.

   cp <colorscheme>.vim ~/.vim/colors

## Colorscheme plugin
The colorscheme requires the terminal to support 256 colors. Most of the
terminals already support this but some multiplexers like tmux might require to
be run with `tmux -2

Enjoy!
