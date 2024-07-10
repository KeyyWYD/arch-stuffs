<div align="center">

# .dotfiles

</div>

## Dependencies
 - **Display Manager:** Sddm
 - **WM:** Hyprland
 - **Fonts:** CaskaydiaCove Nerd Font Mono, JetBrainsMono Nerd Font, San Francisco Fonts and more
 - **Launcher:** Rofi
 - **Bar:** Waybar
 - **Notification Center:** Swaync
 - **LockScreen:** Hyprlock
 - **Idle Daemon:** Hypridle
 - **Terminal:** Alacritty
 - **Wallpaper Daemon:** Swww

> [!Note]
> For a more comprehensive list of dependencies, see [`setup.sh`](https://github.com/KeyyWYD/arch-stuffs/blob/main/setup.sh) (see "Install" section)

## Install

> [!IMPORTANT]
> Backup or remove all existing configs. Otherwise `stow` will fail to create the symlinks.

```bash
git clone https://github.com/KeyyWYD/arch-stuffs.git ~/.dotfiles
cd ~/.dotfiles && git submodule init && git submodule update --recursive

chmod +x setup.sh
./setup.sh
```
 - Install Waybar Spotify Module: [Lizzy](https://github.com/stefur/lizzy)

## Credits
 - **Scripts:** [Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)
