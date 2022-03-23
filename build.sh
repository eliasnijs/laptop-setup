#!/bin/sh

# TODO (Elias): Hold a timestamp for the last build for each file and compare with last edited timestamp,
# then only build the files of which the last edited timestamp is later than the lastbuild timestamp
# OR
# keep a copy of each file and check if it differs from the file now, and only build if it differs.

BASEDIR=$(dirname "$0")
cd $BASEDIR

cp ./configuration/bashrc ~/.bashrc
cp ./configuration/vimrc ~/.vimrc
cp ./configuration/vimrc ~/.config/nvim/init.vim
cp ./configuration/vim-themes/* ~/.config/nvim/colors/

SRC="./configuration/st-config.h"
DEST="./sucklesstools/st/config.h"
FOLDER="./sucklesstools/st"
if ! cmp --silent -- "$SRC" "$DEST"; then
  cp $SRC $DEST 
  cd $FOLDER 
  sudo make install -s
  cd ../../
fi

SRC="./configuration/dwm6.2-config.h"
DEST="./sucklesstools/dwm-6.2/config.h"
FOLDER="./sucklesstools/dwm-6.2"
if ! cmp --silent -- "$SRC" "$DEST"; then
  cp $SRC $DEST 
  cd $FOLDER 
  sudo make install -s
  cd ../../
fi

SRC="./configuration/slstatus-config.h"
DEST="./sucklesstools/slstatus/config.h"
FOLDER="./sucklesstools/slstatus"
if ! cmp --silent -- "$SRC" "$DEST"; then
  cp $SRC $DEST 
  cd $FOLDER 
  sudo make install -s
  cd ../../
fi


