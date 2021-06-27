# Distro
Setup and config files for my linux dev environment.

- **Distro**: *EndeavorOS* (Arch Linux fork)
- **Window Manager**: *I3WM*, light tiling window manager

## Packages

  - Filemanagers: *thunar* and *ranger*
  - Images: *feh* and *nitrogen*
  - Editors: *vscode* and *neovim*
  - Browser: *firefox-developers-edition*
  - Terminal: *alacritty*
  - Calendar: *calcurse*
  
### Bash addons
  - Bash prompt: *starship*
  - Coloring ``ls``: *lsd*
  - *tree* (stdout folder structure)

### Programming
  - jvm skd manager *sdkman*
  - node version manager *nvm*
  - IDE *Intellij Idea* 
  - Rest client *Postman* 
  - *Docker*

### Others
  - Backlight control *light*
  - Neovim file manger [*vim-plug*](https://github.com/junegunn/vim-plug): 
    ```
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```  

### Themes
  - **One Dark**: for alacritty, nvim, vscode and IntellijIdea 

### Fonts
  - Noto Sans: As global GTK font
  - Fira Code Nerd: For Editors, Terminal and IDE

### Backlight fix
1. Install light package 
    ```
    sudo pacman -S light
    ```
2. Give admin privilege
    ```
    chmod +s /usr/bin/light
    ```

### Alternate autotiling
From the [Arch Wiki](https://wiki.archlinux.org/title/i3#Automatically_switch_horizontal_/_vertical_window_split_orientation)
1. Install the autotiling AUR package
    ```
    yay -S autotiling
    ```
2. After installation add the following to your `~/.config/i3/config` and reload i3.
    ```
    exec_always --no-startup-id autotiling
    ```

### Git
1. Add shh key
    ```
    ssh-keygen -t rsa -b 4096 -C "riglesias@ginzo.tech"
    ```
