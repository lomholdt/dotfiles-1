

# Installing Arch Linux on a Macbook Pro Retina
```
sudo pacman -S zsh # Install zsh shell
sudo chsh -s $(which zsh)
```
[Oh my zsh](https://github.com/robbyrussell/oh-my-zsh)

# Configuration
If ethernet is not working, do `ip a` to see listed network devices. Mine shows `ens9` as my
thunderbolt ethernet. To start ethernet run `dhcpcd ens9`. Test if it worked by `ping -c3 www.google.com`

sources:
  - https://bbs.archlinux.org/viewtopic.php?id=156427
  - http://www.cyberciti.biz/faq/linux-list-network-cards-command/

[Install the `yaourt` package manager](http://revryl.com/2013/07/11/yaourt-installation-arch-linux/)

## OS Components

### gnome-settings-daemon

I'm not entirely sure what all this is doing. I need to find some docks and read more about what
it adds. It does allow the Emacs Gtk+ theme to work so I can use ctrl-w and ctrl-h in the browser
without closing tabs and opening history. Might be overkill for that single use, so I need to
figure out what else it's doing and see if I want those things.

```
yaourt gnome-settings-daemon
```

### WiFi
```bash
# Packages
sudo pacman -S wireless_tools

# Install the package
yaourt broadcom-wl

# Load the kernel module
sudo modprobe wl
sudo depmod -a
```

### Fonts

http://www.techrapid.co.uk/linux/arch-linux/improve-font-rendering-on-arch-linux/

```
yaourt ttf-mac-fonts
```

### Touchpad

https://wiki.archlinux.org/index.php/MacBookPro11,x#Touchpad
https://medium.com/@philpl/arch-linux-running-on-my-macbook-2ea525ebefe3#.u5cdphtsp

```bash
yaourt -S xf86-input-mtrack-git
sudo vim /etc/X11/xorg.conf.d/60-mtrack.conf
```

```
# /etc/X11/xorg.conf.d/60-mtrack.conf
Section "InputClass"
    MatchIsTouchpad "on"
    Identifier      "Touchpads"
    Driver          "mtrack"
    Option          "Sensitivity" "0.64"
    Option          "FingerHigh" "5"
    Option          "FingerLow" "2"
    Option          "IgnoreThumb" "true"
    Option          "IgnorePalm" "true"
    Option          "DisableOnPalm" "true"
    Option          "TapButton1" "1"
    Option          "TapButton2" "3"
    Option          "TapButton3" "3"
    Option          "TapButton4" "0"
    Option          "ClickFinger1" "1"
    Option          "ClickFinger2" "2"
    Option          "ClickFinger3" "2"
    Option          "ButtonMoveEmulate" "false"
    Option          "ButtonIntegrated" "true"
#    Option          "ClickTime" "25"
    Option          "BottomEdge" "30"
    Option          "SwipeLeftButton" "8"
    Option          "SwipeRightButton" "9"
    Option          "SwipeUpButton" "0"
    Option          "SwipeDownButton" "0"
#    Option          "ScrollDistance" "75"
    Option          "VertScrollDelta" "-90"
    Option          "HorizScrollDelta" "-90"

    ## Natural Scrolling
    Option          "ScrollUpButton" "5"
    Option          "ScrollDownButton" "4"
    Option          "ScrollLeftButton" "7"
    Option          "ScrollRightButton" "6"
EndSection
```

```
# Add yourself to the users group
sudo gpasswd -a tuxinator input

# Use natural scrolling
echo "pointer = 1 2 3 5 4 6 7 8 9 10 11 12" >> ~/.Xmodmap
```

### Power Settings
There might be some good information [here](https://medium.com/@philpl/arch-linux-running-on-my-macbook-2ea525ebefe3#.u5cdphtsp)
It was too long of a read at the moment for me to validate it.

I Ended up following the power settings [here](https://mchladek.me/post/arch-mbp/)

[Powertop](https://wiki.archlinux.org/index.php/Powertop)
```
sudo pacman -S powertop
```

Disable cardreader when not needed
```
# /etc/udev/rules.d/99-apple_cardreader.rules
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="8406", RUN+="/usr/local/sbin/remove_ignore_usb-device.sh 05ac 8406"
```

Disable bluetooth when not using it
```
# /etc/udev/rules.d/99-apple_broadcom_bcm2046_bluetooth.rules
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="8289", RUN+="/usr/local/sbin/remove_ignore_usb-device.sh 05ac 8289"
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0a5c", ATTRS{idProduct}=="4500", RUN+="/usr/local/sbin/remove_ignore_usb-device.sh 0a5c 4500"
```


### Keyboard Backlight

https://wiki.archlinux.org/index.php/MacBook#Keyboard_Backlight

### Backlight

https://wiki.archlinux.org/index.php/MacBookPro11,x#Screen_backlight

### File Managers

Nautilus (Gnome gui file manager)
```
sudo pacman -S nautilus
```

Ranger (Command line file manager)
```
sudo pacman -S ranger
```

### Linux Monitoring Sensors

```
sudo pacman -S lm_sensors

# View temperatures
sensors
```

## Appearance

### lxappearance
Manage gtk themes
```
sudo pacman -S lxappearance
```

### Lemonbar
Slick status bar
```
yaourt lemonbar-git

# Battery stats
sudo pacman -S acpi
```


## Applications

### NVM

https://github.com/creationix/nvm

### Element

https://github.com/callahanrts/element

### Ag

```bash
sudo pacman -S silver-searcher-git
```

### i3
```
sudo pacman -S dmenu rofi xdotool alsa-utils xbindkeys gnome-terminal conky feh cmake htop upower

# Backlight
yaourt light-git compton-git
```

### Rofi

Rofi config is in Xresources

### Redis
yaourt -S redis

### Docker

https://docs.docker.com/engine/installation/linux/archlinux/

At work, many people use mac with docker. For docker to run on a mac, it needs to run a vm. In our
case, the vm has an IP of 192.168.99.100. Since our configs, namely database.yml, have this
hardcoded into them, we need to find a way to reroute this ip to localhost on linux.

Get ifconfig if it doesn't exist already:
```
sudo pacman -S net-tools
```

http://superuser.com/questions/572077/redirect-some-ip-to-localhost
```
# Add this to your startup script:
sudo ifconfig lo:1 inet 192.168.99.100 netmask 255.255.255.255 up
```

# Check if it's working
ping -c3 192.168.99.100

# Output
#
# PING 192.168.99.100 (192.168.99.100) 56(84) bytes of data.
# 64 bytes from 192.168.99.100: icmp_seq=1 ttl=64 time=0.031 ms
# 64 bytes from 192.168.99.100: icmp_seq=2 ttl=64 time=0.028 ms
# 64 bytes from 192.168.99.100: icmp_seq=3 ttl=64 time=0.029 ms
#
# --- 192.168.99.100 ping statistics ---
# 3 packets transmitted, 3 received, 0% packet loss, time 1998ms
# rtt min/avg/max/mdev = 0.028/0.029/0.031/0.004 ms
```


### MySQL
https://wiki.archlinux.org/index.php/MySQL

```
# Install mariadb
sudo pacman -S mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Enable the service to start at runtime and start it now.
sudo systemctl enable mysqld
sudo systemctl start mysqld
```
Sequel Pro like gui for managing mysql databases on linux
[MySQL Workbench](https://www.mysql.com/products/workbench/)
```
sudo pacman -S mysql-workbench
```


### Spotify

https://wiki.archlinux.org/index.php/spotify

```
# Spotify Beta seems to work best with hidpi for me
yaourt -S spotify-beta

# HiDPI mode
spotify --force-device-scale-factor=1.8
```


### RVM

Had to do the open_ssl fix at the bottom here. Some were also saying there was a readline issue.
Try doing the `rvm pkg install readline` and install with the `--with-readline-dir=$HOME/.rvm/usr`
as well as `--with-openssl-dir=$HOME/.rvm/usr`.
https://wiki.archlinux.org/index.php/RVM#Installing_RVM

### tmux

```
sudo pacman -S tmux
```

### Assorted packages

```
sudo pacman -S imagemagick # image manipulation
```

### Last Pass

```
yaourt lastpass-cli
```
