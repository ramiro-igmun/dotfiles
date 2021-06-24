# linux-setup
Setup and config files for my linux dev environment.

- **Distro**: *EndeavorOS* (Arch Linux fork)
- **Window Manager**: *I3WM*, light tiling window manager

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
