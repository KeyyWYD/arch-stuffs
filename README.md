<div align="center">
  <h1>.dotfiles</h1>
</div>

![Last Commit](https://img.shields.io/github/last-commit/keyywyd/arch-stuffs)

<details>
  <summary>Software</summary>

 - **Display Manager:** [ly](https://github.com/fairyglade/ly)
 - **WM:** Hyprland
 - **Fonts:** San Francisco Fonts
 - **Cursor:** [McMojave](https://github.com/OtaK/McMojave-hyprcursor/)
 - **Launcher:** Rofi
 - **Bar:** Waybar
 - **Notifications:** Dunst
 - **LockScreen:** Hyprlock
 - **Idle Daemon:** Hypridle
 - **Terminal:** Alacritty
 - **Wallpaper Daemon:** Swww
 - **Wallpapers:** [Discord](https://discord.gg/TnJ4h5K), [Repo](https://github.com/vernette/wallpapers)

<blockquote>
  <b>Note:</b> For a list of dependencies, see <a href="https://github.com/KeyyWYD/arch-stuffs/blob/main/setup.sh"><code>setup.sh</code></a>
</blockquote>
</details>

<details>
  <summary>Instructions</summary>

```sh
# Dotfiles
git clone https://github.com/KeyyWYD/arch-stuffs $HOME/dotfiles
cd $HOME/dotfiles
git submodule init && git submodule update --recursive
cp -r .config/* $HOME/.config
cp -r .zsh $HOME
cp -r .zshrc $HOME
```

  <details>
    <summary>Keybinds</summary>
    <div align="center">
      <h2>Keybinds</h2>
 
| Keys | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Return</kbd> | Open Terminal |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Kill Process |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd>+ <kbd>Q</kbd> | Lock Screen |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd> | Log Out |
| <kbd>Super</kbd> + <kbd>F</kbd> | Open File Manager |
| <kbd>Super</kbd> + <kbd>Tab</kbd> | Toggle Floating Mode for Windows |
| <kbd>Super</kbd> + <kbd>Space</kbd> | Open App Menu |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd> | Update Wallpaper |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> | Toggle Fullscreen mode for Windows |
| <kbd>Super</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Move Window Focus |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Move Window |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Resize Window |
| <kbd>Super</kbd> + <kbd>[0-9]</kbd> | Switch Workspaces |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>[0-9]</kbd> | Move Focused Window to Other Workspace | 

  </details>
</details>

<div align="center">
  <h2>Screenshots</h2>
  <h3></h3>
</div>

<div align="center">
  <table>
    <tr><a href="https://github.com/hyprwm/hyprlock">Hyprlock</a></tr><tr><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/lock.png"/></td></tr>
  </table>
</div>

<div align="center">
  <table>
    <tr><a href="https://wiki.hyprland.org">Hyprland</a></tr><tr><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/home.png"/></td></tr>
  </table>
</div>

<div align="center">
  <table>
    <tr><a href="https://github.com/lbonn/rofi">Rofi</a></tr><tr><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/rofi-1.png"/></td><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/rofi-2.png"/></td><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/rofi-3.png"/></td></tr>
  </table>
</div>

<div align="center">
  <h2>Credits</h2>
</div>

_UnixPorn: [r/unixporn](https://www.reddit.com/r/unixporn/)_

_JaKooLit dots: [JaKooLit](https://github.com/JaKooLit/Hyprland-Dots)_

_FireDrop6000 dots: [FireDrop6000](https://github.com/FireDrop6000/hyprland-mydots)_

_Wallpapers: [vernette](https://github.com/vernette)_
