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
nmcli dev wifi connect waffle password 7758539990


####################################################################
# Display Settings
####################################################################
# Load High DPI Settings
xrdb -merge ~/.Xresources

# Set second monitor scale
xrandr --output DP-3 --scale 1.8x1.8


####################################################################

# Set desktop background
feh --bg-scale ~/Pictures/backgrounds/bg9.jpg

# Load keybindings
xmodmap ~/.Xmodmap

# Key Repeat speed
xset r rate 300 20

# Symlink mysql
#ln -s /run/mysqld/mysqld.sock /tmp/mysql.sock

# Reroute traffic from 192.168.99.100 (docker-machine on os x) to localhost
sudo ifconfig lo:1 inet 192.168.99.100 netmask 255.255.255.255 up

# Window manager
exec i3
