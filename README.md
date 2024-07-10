<div align="center">

# .dotfiles

</div>

## Packages
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
To install, execute the following commands:
```bash
git clone https://github.com/KeyyWYD/arch-stuffs.git ~/.dotfiles
cd ~/.dotfiles && git submodule init && git submodule update --recursive

chmod +x setup.sh
./setup.sh
```
 - Install Waybar Spotify Module: [Lizzy](https://github.com/stefur/lizzy)

## Keybinds

<div align="center">

| Keys | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Return</kbd> | Open Terminal |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Kill Process |
| <kbd>Super</kbd> + <kbd>D</kbd> | Open File Manager |
| <kbd>Super</kbd> + <kbd>Tab</kbd> | Toggle Floating Mode for Windows |
| <kbd>Super</kbd> + <kbd>Space</kbd> | Open App Menu |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd> | Update Wallpaper |
| <kbd>Super</kbd> + <kbd>F</kbd> | Toggle Fullscreen Mode for Windows |
| <kbd>Super</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Move Window Focus |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Move Window |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Resize Window |
| <kbd>Super</kbd> + <kbd>[0-9]</kbd> | Switch Workspaces |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>[0-9]</kbd> | Move Focused Window to Other Workspace |

</div>
