#!/bin/bash

BRANCH="develop"
REPO_URL="https://raw.github.com/rmariano/vim-config"

COLORS_DIR="$HOME/.vim/colors"
SYNTAX_DIR="$HOME/.vim/syntax"

echo "Installing $BRANCH . Getting the latest version from $REPO_URL"
for dr in $COLORS_DIR $SYNTAX_DIR; do
    if [[ ! -d $dr ]]; then
        mkdir -p $dr
    fi
done
unset dr;

wget -O $HOME/.vimrc $REPO_URL/$BRANCH/.vimrc
wget -O $COLORS_DIR/tromso.vim $REPO_URL/$BRANCH/colors/tromso.vim
wget -O $SYNTAX_DIR/python.vim $REPO_URL/$BRANCH/syntax/python.vim
wget -O $SYNTAX_DIR/Dockerfile.vim $REPO_URL/$BRANCH/syntax/Dockerfile.vim

echo "Done";
