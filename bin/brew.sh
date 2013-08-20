#1/bin/bash

FORMULAE='tmux ctags ack python vim'

for FORMULA in $FORMULAE; do
  brew install $FORMULA
done
