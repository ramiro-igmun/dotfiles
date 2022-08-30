#!/usr/bin/env bash

# Install neovim plugin manager
printf "\e[1;35mInstalling neovim plugin manager...\n\e[0m"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install fnm node version manager
printf "\e[1;35mInstalling fnm node manager...\n\e[0m"
curl -fsSL https://fnm.vercel.app/install | bash

# Completions for fnm
# mkdir -p $HOME/.config/shell/completions
# touch $HOME/.config/shell/completions/_fnm
fnm completions --shell zsh > $HOME/.config/shell/completions/_fnm

# Give permissions to light executable to be able to control backlight
# sudo chmod +s /usr/bin/light

# TODO install sdkman / autoinstall nvim plugins on init.vim
