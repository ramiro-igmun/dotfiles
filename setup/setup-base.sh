#! /usr/bin/env bash
# Before running this script you must have finished this steps and have NOT rebooted
# Partition and formatted disks, generated fstab

PACKAGE_LIST=~/dotfiles/setup/base

# Set local time
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "KEYMAP=es" >> /etc/vconsole.conf

echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

# Upgrade system
pacman -Syu

# Install paru
git clone https://aur.archlinux.org/paru.git
chmod 777 paru
cd paru
makepkg -si
cd ..
rm -r paru

# Install package list
paru -S --needed - < "$PACKAGE_LIST"

# Install neovim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Give permissions to light executable to be able to control backlight
# sudo chmod +s /usr/bin/light

# Install fnm node version manager
curl -fsSL https://fnm.vercel.app/install | bash

# Completions for fnm
# mkdir -p $HOME/.config/shell/completions
# touch $HOME/.config/shell/completions/_fnm
fnm completions --shell zsh > $HOME/.config/shell/completions/_fnm

# Set the localization variables
cp $HOME/dotfiles/setup/locale.conf /etc/locale.conf

# Enable services
systemctl enable avahi-daemon.service
systemctl enable sshd.service
systemctl enable tlp.service
systemctl enable wpa_supplicant.service
systemctl enable acpid

# Enable timers
systemctl enable paccache.timer
systemctl enable fstrim.timer
systemctl enable reflector.timer

# TODO install sdkman / autoinstall nvim plugins on init.vim

useradd -m ramiro
echo ramiro:password | chpasswd

echo "ramiro ALL=(ALL) ALL" >> /etc/sudoers.d/ramiro
printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
