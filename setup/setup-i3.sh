#! /usr/bin/env bash
# Run this setup script on first login after base installation

PACKAGE_LIST=~/dotfiles/setup/i3

# Make sure there is internet access
sudo systemctl enable --now NetworkManager

# Upgrade system
sudo pacman -Syu

# Install paru
git clone https://aur.archlinux.org/paru.git
chmod 777 paru
cd paru
makepkg -si
cd ..
rm -r paru

# Install package list
paru -S --needed - < "$PACKAGE_LIST"

# Change shell to zsh
chsh -s /bin/zsh

# prepare shell and stow basic configs
rm .bashrc .bash_profile
cd $HOME/dotfiles && stow shell && stow starship && stow xorg && stow fontconfig && stow i3 && stow kitty && stow nvim
cd

# Set tearfree option for amd gpu driver
# sudo cp $HOME/dotfiles/setup/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf
# Set the keyboard layout in X
sudo cp $HOME/dotfiles/setup/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

# TODO install sdkman / autoinstall nvim plugins on init.vim
