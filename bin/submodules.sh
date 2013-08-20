#!/bin/bash

VIM_PLUGINS_DIR='../src/config/vim/bundle'

REPOSITORY_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

VIM_SUBMODULES=(
'https://github.com/altercation/vim-colors-solarized.git'
'https://github.com/kchmck/vim-coffee-script.git'
'https://github.com/kien/ctrlp.vim.git'
'https://github.com/mtth/cursorcross.vim.git'
'https://github.com/Lokaltog/vim-easymotion.git'
'https://github.com/tpope/vim-fugitive.git'
'https://github.com/sjl/gundo.vim.git'
'https://github.com/michaeljsmith/vim-indent-object.git'
'https://github.com/LaTeX-Box-Team/LaTeX-Box.git'
'https://github.com/mtth/locate.vim.git'
'https://github.com/scrooloose/nerdtree.git'
'https://github.com/mtth/scratch.vim.git'
'https://github.com/tpope/vim-surround.git'
'https://github.com/godlygeek/tabular.git'
'https://github.com/mtth/taglist.vim.git'
)
ABS_VIM_SUBMODULES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd $VIM_PLUGINS_DIR && pwd )"
VIM_SUBMODULES_DIR=${ABS_VIM_SUBMODULES_DIR#$REPOSITORY_ROOT/}

cd $REPOSITORY_ROOT

for SUBMODULE in "${VIM_SUBMODULES[@]}"; do
  REPOSITORY=${SUBMODULE##*/}
  SUBMODULE_DIR="$VIM_SUBMODULES_DIR/${REPOSITORY%.*}"
  if [ -e $SUBMODULE_DIR ]; then
    echo "$REPOSITORY already exists"
  else
    git submodule add $SUBMODULE $SUBMODULE_DIR
  fi
done

git submodule update --init
