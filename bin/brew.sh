#1/bin/bash

# Install Homebrew formulae in correct order

FORMULAE='tmux ctags ack python vim'

for FORMULA in $FORMULAE; do
  brew install $FORMULA
done
