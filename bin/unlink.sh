#!/bin/bash

# Removes all symbolic links created by link.sh
# Also deletes any created directories than become empty after unlinking

function delete_link ()
{
  local src_path=$1
  local src_tail=${src_path#$SRC_DIR/}
  local dest_path="$HOME/.$src_tail"
  if [ -h $dest_path ]; then
    printf "%10s %-20s\n" "deleted" $src_tail
    rm $dest_path
    local dest_dir=$(dirname $dest_path)
    if find $dest_dir -maxdepth 0 -empty | read; then
      rmdir $dest_dir
    fi
  fi
}

function unlink_directory ()
{
  local depth=$(expr $2 - 1)
  local filepaths="$1/*"
  local filepath=
  for filepath in $filepaths; do
    if [ -f $filepath ] || [ $depth == '0' ]; then
      delete_link $filepath
    elif [ -d $filepath ]; then
      unlink_directory $filepath $depth
    fi
  done
}

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../src && pwd )"

echo 'Unlinking...'
unlink_directory $SRC_DIR 2
