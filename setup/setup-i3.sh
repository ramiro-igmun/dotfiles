#! /usr/bin/env bash
# Run this setup script on first login after base installation

PACKAGE_LIST=~/dotfiles/setup/i3

# Make sure there is internet access
printf "\e[1;35mEnabling network manager\n\e[0m"
sudo systemctl enable --now NetworkManager

# Upgrade system
sudo pacman -Syu

# Install paru
printf "\e[1;35mInstalling paru AUR helper...\n\e[0m"
git clone https://aur.archlinux.org/paru.git
chmod 777 paru
cd paru
makepkg -si
cd ..
rm -r paru

# Install package list
printf "\e[1;35mInstalling i3 environment...\n\e[0m"
paru -S --needed - < "$PACKAGE_LIST"

# Change shell to zsh
printf "\e[1;35mChanging shell to zsh...\n\e[0m"
chsh -s /bin/zsh

# prepare shell and stow basic configs
printf "\e[1;35mInstalling dotfiles...\n\e[0m"
rm .bashrc .bash_profile
cd $HOME/dotfiles && stow shell && stow starship && stow xorg && stow fontconfig && stow i3 && stow kitty && stow nvim && stow ranger
cd

# Set tearfree option for amd gpu driver
# sudo cp $HOME/dotfiles/setup/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf
# Set the keyboard layout in X
sudo cp $HOME/dotfiles/setup/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

# TODO install sdkman / autoinstall nvim plugins on init.vim
