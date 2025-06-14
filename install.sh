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
pacman -Syu xorg xinit fastfetch feh rofi ttf-fira-code amixer brightnessctl git

# install yay for aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# install aur applications
yay -Syu pokeget

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

echo "Installation complete: you can now restart your computer!"
