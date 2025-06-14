#!/bin/bash

# truneosprinter 2025
# dwm gruvbox rice install script (run as super user!)

# create home directories
mkdir ~/Desktop
mkdir ~/Downloads
mkdir ~/Pictures
mkdir ~/Documents
mkdir ~/Music
mkdir ~/Videos

# install applications
pacman -Syu xorg xinit fastfetch feh rofi ttf-fira-code amixer brightnessctl

# move config files to the correct directories
cp -r dwm ~/.config/
cp -r fastfetch ~/.config
cp -r rofi ~/.config
cp -r slstatus ~/.config
cp -r st ~/.config
cp fehbg ~/.fehbg
cp xinitrc ~/.xinitrc
cp wallpaper.png ~/.wallpaper.png
cp issue /etc/issue
