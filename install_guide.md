

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

### NVM

https://github.com/creationix/nvm

### Element

https://github.com/callahanrts/element

### i3
```
sudo pacman -S dmenu rofi xdotool alsa-utils xbindkeys gnome-terminal conky feh cmake htop upower

# Backlight
yaourt light-git compton-git
```

### Rofi

Xresources
