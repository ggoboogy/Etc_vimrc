#!/bin/bash

# copy config files
cp vimrc $HOME/.vimrc
cp tmux.conf $HOME/.tmux.conf
cp gitconfig $HOME/.gitconfig

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
