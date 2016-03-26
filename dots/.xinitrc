#!/bin/sh
#
# ~/.xinitrc
#
# Note: sudo startup scripts are being run in /etc/rc.local
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Start network manager with cli
# nmcli dev wifi connect <name> password <password>
nmcli dev wifi connect Callahan\ cLAN password 7755448566
nmcli dev wifi connect Totally\ Legitimate\ Business password p@nc@ke$!


####################################################################
# Display Settings
####################################################################
# Load High DPI Settings
xrdb -merge ~/.Xresources

# Set second monitor scale
xrandr --output DP-3 --scale 2x2

####################################################################

# Set desktop background
feh --bg-scale ~/Pictures/background.png

# Load keybindings
xmodmap ~/.Xmodmap

# Key Repeat speed
xset r rate 300 20

# Symlink mysql
ln -s /run/mysqld/mysqld.sock /tmp/mysql.sock

# Window manager
exec i3
