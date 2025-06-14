#!/bin/bash

# truneosprinter 2025
# dwm gruvbox rice install script

CURRENTDIR="$PWM"

# create home directories
mkdir ~/Desktop
mkdir ~/Downloads
mkdir ~/Pictures
mkdir ~/Documents
mkdir ~/Music
mkdir ~/Videos

# install applications
sudo pacman -Syu xorg xorg-xinit fastfetch feh rofi ttf-fira-code alsa-utils brightnessctl git

# install pokeget
git clone https://aur.archlinux.org/pokeget.git
cd pokeget
makepkg -si
cd ..
rm -rf pokeget

# move config files to the correct directories
cp -r dwm ~/.config/
cp -r fastfetch ~/.config/
cp -r rofi ~/.config/
cp -r slstatus ~/.config/
cp -r st ~/.config/
cp fehbg ~/.fehbg
cp xinitrc ~/.xinitrc
cp wallpaper.png ~/.wallpaper.png
sudo cp issue /etc/issue

# add autostart to bashrc
echo '[[ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" ]] && startx || { echo ""; fastfetch; echo ""; }' >> ~/.bashrc

# compile dwm
cd ~/.config/dwm
sudo make clean install

# compile slstatus
cd ~/.config/slstatus
sudo make clean install

# compile st
cd ~/.config/st
sudo make clean install

cd $CURRENTDIR

echo "Installation complete: you can now restart your computer!"
