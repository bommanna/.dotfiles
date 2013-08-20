#!/bin/bash

# TODO: check if mac

# install (or update) Homebrew and formulae
if command -v brew | read; then
  brew update
else
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

FORMULAE='git tmux ctags ack python vim'
for FORMULA in $FORMULAE; do
  brew install $FORMULA
done

# clone dotfiles git repository
cd ~
if [ -e '.dotfiles' ]; then
  cd .dotfiles
  git pull origin master
else
  git clone 'https://github.com/mtth/.dotfiles.git'
  cd .dotfiles
fi

# run dotfile binaries
BINARIES='link.sh submodules.sh'
for BINARY in $BINARIES; do
  bash "bin/$BINARY"
done
