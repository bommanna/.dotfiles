#!/bin/bash

BREW_FORMULAE='bash git tmux ctags ack python vim coreutils node ruby wget fortune'
NODE_PACKAGES='coffee-script coffeelint'
PYTHON_PACKAGES='virtualenv nose ipython jedi requests'
RUBY_GEMS='haml'

if [ "$(uname)" == "Darwin" ]; then
  # Mac OS X
  if command -v brew | read; then
    echo 'Updating homebrew...'
    brew update
  else
    echo 'Installing homebrew...'
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  fi
  echo 'Installing homebrew formulae...'
  for FORMULA in $BREW_FORMULAE; do
    if brew list $FORMULA 2>&1 1>/dev/null | read; then
      brew install $FORMULA
    else
      brew upgrade $FORMULA 2>/dev/null || echo "$FORMULA already up-to-date."
    fi
  done
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux
  echo 'TODO'
  exit 0
else
  echo 'Sorry, not compatible for your system.' >&2
  exit 1
fi

echo 'Installing node packages...'
for PACKAGE in $NODE_PACKAGES; do
  npm install -g $PACKAGE
done

echo 'Installing python packages...'
for PACKAGE in $PYTHON_PACKAGES; do
  pip install --upgrade $PACKAGE
done

echo 'Installing ruby gems...'
for GEM in $RUBY_GEMS; do
  gem install $GEM
done

cd ~
if [ -e '.dotfiles' ]; then
  echo 'Updating dotfiles repository...'
  cd .dotfiles
  git pull origin master
else
  echo 'Cloning dotfiles repository...'
  git clone 'https://github.com/mtth/.dotfiles.git'
  cd .dotfiles
fi

echo 'Running dotfiles binaries...'
BINARIES='link.sh submodules.sh'
for BINARY in $BINARIES; do
  bash "bin/$BINARY"
done

echo 'Installation complete!'
