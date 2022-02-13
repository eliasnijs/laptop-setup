#!/bin/sh

BASH="/home/eliasnijs/.bashrc"
VIM="/home/eliasnijs/.vimrc"
SLSTATUS="/home/eliasnijs/System/sucklesstools/slstatus/config.h"
ST="/home/eliasnijs/System/sucklesstools/st/config.h"
DWM="/home/eliasnijs/System/sucklesstools/dwm-6.2/config.h"

cd /home/eliasnijs/System/configfiles
cp $BASH       ./bashrc
cp $VIM        ./vimrc 
cp $SLSTATUS   ./slstatus-config.h
cp $ST ./st-config.h
cp $DWM ./dwm6.2-config.h


