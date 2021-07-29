#! /usr/bin/env bash

PACKAGE_LIST=~/dotfiles/community

# Install paru
git clone https://aur.archlinux.org/paru.git
chmod 777 paru
cd paru
makepkg -si
cd ..
sudo rm -r paru

# Install package list
paru -S -needed - < "$PACKAGE_LIST"

# Change shell to zsh
chsh -s /bin/zsh

# Install neovim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Give permissions to light executable to be able to control backlight
chmod +s /usr/bin/light

# Install fnm node version manager
curl -fsSL https://fnm.vercel.app/install | zsh

# Completions for fnm
mkdir -p $HOME/.config/shell/completions
touch _fnm
fnm completions --shell zsh > _fnm

