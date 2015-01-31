#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4

# VBox guest additions
VBoxClient-all

# Set background
/home/ksami/.fehbg

# Gets settings for urxvt from ~/.Xresources
[[ -f /home/ksami/.Xresources ]] && xrdb -merge /home/ksami/.Xresources

# ...or the Window Manager of your choice
exec i3

# i3 with gaps patch
# github.com/DSMan195276/i3 (dsm-changes)
#exec /home/ksami/i3/i3
