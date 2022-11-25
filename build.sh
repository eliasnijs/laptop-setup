#!/bin/bash

BASEDIR=$(dirname "$0")
cd $BASEDIR

cp ./configuration/bashrc ~/.bashrc
source ~/.bashrc

cp -r ./configuration/nvim/* ~/.config/nvim/

cp ./configuration/picom.conf ~/.config/picom/picom.conf

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
update_suckless_tool "./configuration/dmenu-config.h" "./sucklesstools/dmenu/config.h"

cd scripts
sudo ./setup 2> /dev/null
