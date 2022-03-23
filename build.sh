#!/bin/sh

# TODO (Elias): Make a dependency list
# Q: do we let the user install these or do we do this automatically?

BASEDIR=$(dirname "$0")
cd $BASEDIR

# NOTE (Elias): copy pasting these is so fast that we don't need to check if
# the files were updated.
cp ./configuration/bashrc ~/.bashrc
cp ./configuration/vimrc ~/.vimrc
cp ./configuration/vimrc ~/.config/nvim/init.vim
cp ./configuration/vim-themes/* ~/.config/nvim/colors/

update_suckless_tool()
{
  SRC=$1
  DEST=$2
  if ! cmp --silent -- "$SRC" "$DEST"; then
    cp $SRC $DEST 
    cd $(dirname $DEST) 
    sudo make install -s
    cd ../../
  fi
}

update_suckless_tool "./configuration/st-config.h" "./sucklesstools/st/config.h"
update_suckless_tool "./configuration/dwm6.2-config.h" "./sucklesstools/dwm-6.2/config.h"
update_suckless_tool "./configuration/slstatus-config.h" "./sucklesstools/slstatus/config.h"

