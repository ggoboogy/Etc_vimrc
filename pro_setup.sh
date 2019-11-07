#!/bin/bash

# copy config files
cp vimrc $HOME/.vimrc
cp gitconfig $HOME/.gitconfig

TMUX_VERSION="$(tmux -V | cut -c 6- | sed 's/[^0-9.]*//g')"
if [[ $(echo "$TMUX_VERSION >= 2.1" | bc) -eq 1 ]]; then
  cp tmux_2.1+.conf $HOME/.tmux.conf
else
  cp tmux_legacy.conf $HOME/.tmux.conf
fi

# install diff-so-fancy
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install diff-so-fancy
fi

# install vim-plug
rm -rf $HOME/.vim/*
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install requirements
sudo pip3 install -r requirements.txt
