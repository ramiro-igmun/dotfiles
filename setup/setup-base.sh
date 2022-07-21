#! /usr/bin/env bash
# Before running this script you must have finished this steps and have NOT rebooted
# Partition and formatted disks, generated fstab

PACKAGE_LIST=~/dotfiles/setup/base

# Set local time
printf "\e[1;35mSetting up time and localization\n\e[0m"
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "KEYMAP=es" >> /etc/vconsole.conf

# Set the localization variables
cp $HOME/dotfiles/setup/locale.conf /etc/locale.conf

# Set the hosts
printf "\e[1;35mSetting up hosts...\n\e[0m"
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

# Set user
printf "\e[1;35mSetting up root user...\n\e[0m"
echo root:password | chpasswd

# Upgrade system
printf "\e[1;35mUpgrading the system and installing base packages...\n\e[0m"
pacman -Syu

# Install package list
pacman -S --needed - < "$PACKAGE_LIST"

printf "\e[1;35mSetting up grub...\n\e[0m"
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Install neovim plugin manager
printf "\e[1;35mInstalling neovim plugin manager...\n\e[0m"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Give permissions to light executable to be able to control backlight
# sudo chmod +s /usr/bin/light

# Install fnm node version manager
printf "\e[1;35mInstalling fnm node manager...\n\e[0m"
curl -fsSL https://fnm.vercel.app/install | bash

# Completions for fnm
# mkdir -p $HOME/.config/shell/completions
# touch $HOME/.config/shell/completions/_fnm
fnm completions --shell zsh > $HOME/.config/shell/completions/_fnm

# Enable services
printf "\e[1;35mEnabling services...\n\e[0m"
systemctl enable NetworkManager
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

printf "\e[1;35mSetting up user...\n\e[0m"
useradd -m ramiro
echo ramiro:password | chpasswd

echo "ramiro ALL=(ALL) ALL" >> /etc/sudoers.d/ramiro
printf "\e[1;32mDone! Type exit, umount -a and reboot.\n\e[0m"
