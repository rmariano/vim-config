#!/bin/bash
COLORS_DIR="$HOME/.vim/colors"

echo "Getting the latest version from https://github.com/rmariano/vim-config"
[ ! -d "$HOME/.vim" ] &&  mkdir "$HOME/.vim";
[ ! -d $COLORS_DIR ] && mkdir -p "$HOME/.vim/colors";

wget -O "$HOME/.vimrc" https://raw.github.com/rmariano/vim-config/master/.vimrc
wget -O "$COLORS_DIR/tromso.vim" https://raw.github.com/rmariano/vim-config/master/colors/tromso.vim

echo "Done";
