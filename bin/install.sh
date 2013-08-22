#!/bin/bash

# TODO: check if mac

# install (or update/upgrade) Homebrew and formulae
if command -v brew | read; then
  brew update
else
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

FORMULAE='git tmux ctags ack python vim coreutils node ruby'
for FORMULA in $FORMULAE; do
  if brew list $FORMULA 2>&1 1>/dev/null | read; then
    brew install $FORMULA
  else
    brew upgrade $FORMULA
  fi
done

# install interesting node packages
PACKAGES='coffee-script coffeelint'
for PACKAGE in $PACKAGES; do
  npm install -g $PACKAGE
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

echo 'Installation complete!'
