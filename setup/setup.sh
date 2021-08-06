#! /usr/bin/env bash

PACKAGE_LIST=~/dotfiles/community
AUR=~/dotfiles/aur

# Set local time
sudo ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
sudo hwclock --systohc

sudo echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
sudo locale-gen

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
sudo rm -r paru

# Install package list
paru -S --needed - < "$PACKAGE_LIST"

# Install package list
paru -S --needed - < "$AUR"

# Change shell to zsh
chsh -s /bin/zsh

# Install neovim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Give permissions to light executable to be able to control backlight
sudo chmod +s /usr/bin/light

# Install fnm node version manager
curl -fsSL https://fnm.vercel.app/install | bash

# prepare shell and stow basic configs
rm .bashrc .bash_profile
cd $HOME/dotfiles && stow shell && stow starship && stow xorg && stow fontconfig && stow i3 && stow kitty && stow nvim
cd

source $HOME/.bashrc

# Completions for fnm
# mkdir -p $HOME/.config/shell/completions
# touch $HOME/.config/shell/completions/_fnm
fnm completions --shell zsh > $HOME/.config/shell/completions/_fnm

# Enable services
sudo systemctl enable avahi-daemon.service
sudo systemctl enable sshd.service
sudo systemctl enable tlp.service
sudo systemctl enable wpa_supplicant.service

# Enable timers
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer

# TODO install sdkman / autoinstall nvim plugins on init.vim