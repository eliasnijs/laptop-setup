#!/bin/bash

FORCE_UPDATE=false
THEME=""

while getopts ":f" opt; do
  case ${opt} in
    f)
      FORCE_UPDATE=true
      ;;
    \? )
      echo "invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

THEME="$1"
if [ -z "$THEME" ]; then
    echo "error: theme argument is required."
    exit 1
fi
if [ ! -f "./$THEME" ]; then
    echo "error: theme '$THEME' does not exist."
    exit 1
fi

echo "FORCE_UPDATE: $FORCE_UPDATE"
echo "THEME: $THEME"


#############

BASEDIR=$(dirname "$0")
cd $BASEDIR

echo "[build]# synchronizing configuration files..."
cp ./configuration/bashrc ~/.bashrc
source ~/.bashrc

cp -r ./configuration/nvim/* ~/.config/nvim/

cp ./configuration/picom.conf ~/.config/picom/picom.conf
echo "[build]# synchronized configuration files"

update_suckless_tool()
{
  NAME=$1
  SRC=$2
  DEST=$3

  echo "[build]# updating $NAME..."
  if ! cmp --silent -- "$SRC" "$DEST" || ! cmp --silent -- "$THEME" "$(dirname $DEST)/theme.h" || $FORCE_UPDATE; then
    cp $SRC $DEST
    cp $THEME "$(dirname $DEST)/theme.h"
    cd $(dirname $DEST)
    sudo make install -s
    cd ../../
  else
    echo "[build]# $NAME is already up to date"
  fi
}

echo "[build]# updating system software..."
update_suckless_tool "terminal (st)"            "./configuration/st-config.h" 	     	"./sucklesstools/st/config.h"
update_suckless_tool "status-bar (slstatus)"    "./configuration/slstatus-config.h" 	"./sucklesstools/slstatus/config.h"
update_suckless_tool "system-interface (dmenu)" "./configuration/dmenu-config.h"    	"./sucklesstools/dmenu/config.h"
update_suckless_tool "window-manager (dwm6.2)"  "./configuration/dwm6.2-config.h" 	"./sucklesstools/dwm-6.2/config.h"

cd scripts
sudo ./setup 2> /dev/null
echo "[build]# system software updated"
