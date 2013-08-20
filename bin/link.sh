#!/usr/bash

# Creates symlinks for all available dotfiles
# Overrides any previously existing symlinks
# But preserves any original dotfiles

function create_link ()
{
  local src_path=$1
  local src_tail=${src_path#$SRC_DIR/}
  local dest_path="$HOME/.$src_tail"
  if [ ! -e $dest_path ]; then
    printf "%10s %-20s\n" "created" $src_tail
    mkdir -p $(dirname $dest_path)
    ln -s $src_path $dest_path
  elif [ -h $dest_path ]; then
    printf "%10s %-20s\n" "replaced" $src_tail
    rm $dest_path
    ln -s $src_path $dest_path
  else
    printf "%10s %-20s\n" "skipped" $src_tail
  fi
}

function link_directory ()
{
  local depth=$(expr $2 - 1)
  local filepaths="$1/*"
  local filepath
  for filepath in $filepaths; do
    if [ -f $filepath ] || [ $depth == '0' ]; then
      create_link $filepath
    elif [ -d $filepath ]; then
      link_directory $filepath $depth
    fi
  done
}

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../src && pwd )"

echo 'Linking...'
link_directory $SRC_DIR 2
