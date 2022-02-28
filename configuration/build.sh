#!/bin/sh


cp /home/eliasnijs/System/configuration/bashrc ~/.bashrc

cp /home/eliasnijs/System/configuration/vimrc ~/.vimrc

cp /home/eliasnijs/System/configuration/vimrc ~/.config/nvim/init.vim

cp /home/eliasnijs/System/configuration/st-config.h ~/System/sucklesstools/st/config.h
cd /home/eliasnijs/System/sucklesstools/st
sudo make install

cp /home/eliasnijs/System/configuration/dwm6.2-config.h ~/System/sucklesstools/dwm-6.2/config.h
cd /home/eliasnijs/System/sucklesstools/dwm-6.2
sudo make install

cp /home/eliasnijs/System/configuration/slstatus-config.h ~/System/sucklesstools/slstatus/config.h
cd /home/eliasnijs/System/sucklesstools/slstatus
sudo make install
