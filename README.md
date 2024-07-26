<div align="center">
  <h1>
    .dotfiles
  </h1>

![Last Commit](https://img.shields.io/github/last-commit/keyywyd/arch-stuffs?style=for-the-badge) ![Repo size](https://img.shields.io/github/repo-size/KeyyWYD/arch-stuffs?style=for-the-badge)
</div>

<div align="center">
  <h2>
    Software
  </h2>
  <table border="1" cellpadding="8" cellspacing="0">
    <tr>
      <td><b>Display Manager</b></td>
      <td><a href="https://github.com/fairyglade/ly">ly</a></td>
    </tr>
    <tr>
      <td><b>Window Manager</b></td>
      <td><a href="https://hyprland.org">Hyprland</a></td>
    </tr>
    <tr>
      <td><b>Fonts</b></td>
      <td><a href="https://github.com/thelioncape/San-Francisco-family">San Francisco</a> (Pro, Mono)</td>
    </tr>
    <tr>
      <td><b>Cursor</b></td>
      <td><a href="https://github.com/OtaK/McMojave-hyprcursor/">McMojave</a></td>
    </tr>
    <tr>
      <td><b>Icons</b></td>
      <td><a href="https://www.gnome-look.org/p/1340791">Reversal</a></td>
    </tr>
    <tr>
      <td><b>Launcher</b></td>
      <td><a href="https://github.com/lbonn/rofi">Rofi</a></td>
    </tr>
    <tr>
      <td><b>Bar</b></td>
      <td><a href="https://github.com/Alexays/Waybar">Waybar</a></td>
    </tr>
    <tr>
      <td><b>Notifications</b></td>
      <td>Dunst</td>
    </tr>
    <tr>
      <td><b>LockScreen</b></td>
      <td><a href="https://github.com/hyprwm/hyprlock">Hyprlock</a></td>
    </tr>
    <tr>
      <td><b>Idle Daemon</b></td>
      <td><a href="https://github.com/hyprwm/hypridle">Hypridle</a></td>
    </tr>
    <tr>
      <td><b>Terminal</b></td>
      <td><a href="https://github.com/kovidgoyal/kitty">Kitty</a></td>
    </tr>
    <tr>
      <td><b>Wallpaper Daemon</b></td>
      <td><a href="https://github.com/LGFae/swww">Swww</a></td>
    </tr>
  </table>
</div>

> [!Note]
> For a list of dependencies, see [`setup.sh`](https://github.com/KeyyWYD/arch-stuffs/blob/main/setup.sh).

<details>
  <summary>Instructions</summary>

  <h3 align="left">
    Install Steps
  </h3>
  
- Using [`Stow`](https://archlinux.org/packages/extra/any/stow/) (Recommended)

  <blockquote>
    <b>Note:</b> Backup or remove all existing configs, otherwise stow will fail to create symlinks.
  </blockquote>

```sh
git clone https://github.com/KeyyWYD/arch-stuffs $HOME/.dotfiles
cd $HOME/.dotfiles
git submodule init && git submodule update --recursive
stow .
```

- Manually
```sh
git clone https://github.com/KeyyWYD/arch-stuffs .dotfiles
cd .dotfiles
git submodule init && git submodule update --recursive
cp -r .config/* $HOME/.config
cp -r .local/* $HOME/.local
cp -r .zsh $HOME
cp -r .zshrc $HOME
cp -r .gtkrc-2.0 $HOME
```

  <h3 align="left">
    Updating
  </h3>

```sh
cd $HOME/.dotfiles
git pull
stow --adopt .
```

  <details>
    <summary>Keybinds</summary>
    <div align="center">
      <h2>Keybinds</h2>
      <table border="1" cellpadding="8" cellspacing="0">
        <tr>
          <td><b>Keys</b></td>
          <td><b>Action</b></td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Return</kbd></td>
          <td>Open Terminal</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Q</kbd></td>
          <td>Kill Process</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Q</kbd></td>
          <td>Lock Screen</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd></td>
          <td>Log Out</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>F</kbd></td>
          <td>Open File Manager</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Tab</kbd></td>
          <td>Toggle Floating Mode for Windows</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Space</kbd></td>
          <td>Open App Menu</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd></td>
          <td>Update Wallpaper</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd></td>
          <td>Toggle Fullscreen mode for Windows</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>←</kbd> <kbd>→</kbd> <kbd>↑</kbd> <kbd>↓</kbd></td>
          <td>Move Window Focus</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd> <kbd>→</kbd> <kbd>↑</kbd> <kbd>↓</kbd></td>
          <td>Move Window</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd> <kbd>→</kbd> <kbd>↑</kbd> <kbd>↓</kbd></td>
          <td>Resize Window</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>0</kbd> to <kbd>9</kbd></td>
          <td>Switch Workspaces</td>
        </tr>
        <tr>
          <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd> to <kbd>9</kbd></td>
          <td>Move Focused Window to Other Workspace</td>
        </tr>
      </table>
    </div>
  </details>
</details>

<div align="center">
  <h2>Screenshots</h2>
</div>

<div align="center">
  <table>
   <tr><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/lock.png"/></td></tr>
  </table><table>
   <tr><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/home.png"/></td></tr>
  </table><table>
   <tr><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/rofi-1.png"/></td><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/rofi-2.png"/></td><td>
    <img src="https://raw.githubusercontent.com/KeyyWYD/arch-stuffs/main/assets/img/rofi-3.png"/></td></tr>
  </table>
</div>

<div align="center">
  <h2>Credits</h2>
</div>

_UnixPorn: [r/unixporn](https://www.reddit.com/r/unixporn/), [Discord](https://discord.gg/TnJ4h5K)_

_JaKooLit dots: [JaKooLit](https://github.com/JaKooLit/Hyprland-Dots)_

_FireDrop6000 dots: [FireDrop6000](https://github.com/FireDrop6000/hyprland-mydots)_

_Wallpapers: [vernette](https://github.com/vernette/wallpapers)_
