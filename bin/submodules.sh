#!/bin/bash

# Download missing submodules and update any existing ones
# Currently only used for Vim plugins

# Array of Vim plugin git repositories
VIM_SUBMODULES=(
'https://github.com/altercation/vim-colors-solarized.git'
'https://github.com/kchmck/vim-coffee-script.git'
'https://github.com/kien/ctrlp.vim.git'
'https://github.com/mtth/cursorcross.vim.git'
'https://github.com/mtth/vim-easymotion.git'
'https://github.com/tpope/vim-fugitive.git'
'https://github.com/LaTeX-Box-Team/LaTeX-Box.git'
'https://github.com/michaeljsmith/vim-indent-object.git'
'https://github.com/mtth/locate.vim.git'
'https://github.com/mtth/scratch.vim.git'
'https://github.com/tpope/vim-surround.git'
'https://github.com/godlygeek/tabular.git'
'https://github.com/mtth/taglist.vim.git'
'https://github.com/mtth/syntastic.git'
'https://github.com/mtth/vim-virtualenv.git'
'https://github.com/davidhalter/jedi-vim.git'
'https://github.com/tpope/vim-haml.git'
'https://github.com/wavded/vim-stylus.git'
'https://github.com/mtth/compilastic.vim.git'
)

# Unused modules currently
OTHER_VIM_MODULES=(
'https://github.com/SirVer/ultisnips.git'
'https://github.com/sjl/gundo.vim.git'
)

# Directory where Vim plugins will be installed
VIM_PLUGINS_DIR='../src/config/vim/bundle'

# Main

REPOSITORY_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
ABS_VIM_SUBMODULES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd $VIM_PLUGINS_DIR && pwd )"
VIM_SUBMODULES_DIR=${ABS_VIM_SUBMODULES_DIR#$REPOSITORY_ROOT/}
declare -A ACTIVE_VIM_SUBMODULES

cd $REPOSITORY_ROOT

echo 'Checking for new submodules...'
for SUBMODULE_URL in "${VIM_SUBMODULES[@]}"; do
  REPOSITORY=${SUBMODULE_URL##*/}
  SUBMODULE_DIR="$VIM_SUBMODULES_DIR/${REPOSITORY%.*}"
  if [ ! -e $SUBMODULE_DIR ]; then
    echo "Installing ${SUBMODULE_DIR}..."
    git submodule add --force $SUBMODULE_URL $SUBMODULE_DIR
  fi
  ACTIVE_VIM_SUBMODULES["${SUBMODULE_DIR}"]=1
done

echo 'Checking for deleted submodules...'
VIM_SUBMODULE_PATHS="$VIM_SUBMODULES_DIR/*"
for SUBMODULE_DIR in $VIM_SUBMODULE_PATHS; do
  if [ ! ${ACTIVE_VIM_SUBMODULES[$SUBMODULE_DIR]} ]; then
    SUBMODULE_NAME="${SUBMODULE_DIR##*/}"
    echo "Uninstalling ${SUBMODULE_NAME}..."
    git submodule deinit $SUBMODULE_DIR
    git rm $SUBMODULE_DIR
    sed -i.bak "/${SUBMODULE_NAME}/d" .gitmodules && rm .gitmodules.bak
  fi
done

echo 'Updating submodules...'
git submodule update --init
