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
