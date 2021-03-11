#!/bin/sh

ln -sf ~/.config/shellrc ~/.mkshrc
ln -sf ~/.config/profile ~/.profile

[ -x "$(command -v lesskey)" ] && lesskey -o less/lesskey less/lesskeyrc

su -c "mkdir -p /etc/X11/xorg.conf.d &&
       ln -sf $HOME/.config/X11/20-intel-gpu.conf /etc/X11/xorg.conf.d &&
       ln -sf $HOME/.config/X11/70-synaptics.conf /etc/X11/xorg.conf.d"
