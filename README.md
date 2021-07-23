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
  - Neovim plugin manger [*vim-plug*](https://github.com/junegunn/vim-plug): 
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

### PACKAGE LIST FOR CLEAN INSTALL
  - **System**
    - NetworkManager
    - network-manager-applet (network manager tray)
    - xorg-server
    - xorg-xinit (create .xinitrc and edit the last line to execute WM on startx -> 'exec i3')
    - install a system font (ej. ttf-dejavu)
    - Dunst (notifications)
    - amd-ucode (microcode for amd -> see arch wiki)
    - arandr (xrandr GUI for display management)
    - xclip (clipboard nvim integration)
  - **Fonts**
    - Noto Sans
    - FiraCode Nerd Font
  - **WM**
    - i3-gaps
    - i3-lock
    - i3blocks(optional)
  - **Terminal**
    - kitty
  - **Utils**
    - git
  - **Audio**
    - Alsa:
        - alsa-utils
        - alsa-plugins ??
    - pulseaudio
    - pavucontrol
  - **AUR**
    - paru
      ```
      git clone https://aur.archlinux.org/paru.git
      cd paru
      makepkg -si
      ```
  - **Editor**
    - neovim
      - Run the following to install plugin manager:
      ```
      sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

      ```  
    - vscode
    - intelliJ
  - **Others**
    - neofetch
    - dmenu
    - rofi

  - **Services active**
    - alsa-restore.service (Sound)
    - dbus.service
    - getty@tty1.service
    - kmod-static-nodes.service
    - lvm2-monitor.service (for logical volume management. Better disable?)
    - NetworkManager.service
    - ntpd.service (Syncronize time)
    - polkit.service (Control system wide priviledges for communication between programs)
    - rtkit-daemon.service (Used by pulseaudio)
    - systemd-journal-flush.service
    - systemd-journald.service
    - systemd-logind.service
    - systemd-modules-load.service
    - systemd-random-seed.service
    - systemd-remount-fs.service
    - systemd-sysctl.service
    - systemd-tmpfiles-setup-dev.service
    - systemd-tmpfiles-setup.service
    - systemd-udev-trigger.service
    - systemd-udevd.service
    - systemd-update-utmp.service
    - systemd-user-sessions.service
    - tlp.service (Battery life)
    - user-runtime-dir@1000.service
    - user@1000.service
    - wpa_supplicant.service (Wireless)

### ** TODO **
- Filemanagers: ranger?? pcmanfm??
- Calendar: calcurse??
- Icons??
- Install nvim pluginmanager
- rofi and dunst themes?? config files from dotfiles?
- Alternative browser to firefox??
- Bitwarden dmenu client??
- Picom
- xclip
- zsh install, config...
