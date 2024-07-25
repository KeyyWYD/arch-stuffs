#!/usr/bin/env bash

cat << "EOF"
                                                 ,
                .         ,-.       _,---._ __  / \
               / \       /  )    .-'       `./ /   \
              /   \     (  (   ,'            `/    /|
             /     \     \  `-"             \'\   / |
            /.      \     `.              ,  \ \ /  |
           ,_ `.     \     /`.          ,'-`----Y   |
          /   ``-     .   (            ;        |   '
         /             `  |  ,-.    ,-'  btw    |  /
        /               `.|  | (   |            | /
      .`      ."`".       \  |  \  `.___________|/
     .       '     \       \-'   `--'
    /        \      ;     -.\
   /        .'     /._     `".
  /   .-"`             `"-.   `.
.`.-`                       `-._\
`                               `

EOF

is_installed() {
    local pkg=$1

    if sudo pacman -Qi "${pkg}" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Update mirrorlist
upd_mirrors() {
  echo
  echo -e Updating mirrorlist...

    # Install pacman-contrib package
  if is_installed "pacman-contrib"; then
    sleep 0.1
  else
    echo -e `pacman-contrib` not found. INSTALLING...
    sudo pacman -S --noconfirm pacman-contrib
  fi

  # Backup the current mirrorlist
  if [ ! -f "/etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak" ]; then
    echo -e Creating mirrorlist backup...
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
  fi

  # Fetch, rank mirrors, and update mirrorlist
  echo -e Updating mirrorlist...
  sudo curl -s "https://archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=6&use_mirror_status=on" \
   | sed -e "s/^#Server/Server/" -e "/^#/d" \
   | rankmirrors -n 6 - | sudo tee /etc/pacman.d/mirrorlist
  
  echo -e Mirror list updated successfully.
  sleep 0.5
}

# packages and deps
_packages() {
    local packages=(
        # SYSTEM --------------------------------------------------------------
        'pipewire'                  
        'pipewire-alsa'             
        'pipewire-audio'            
        'pipewire-pulse'            
        'wireplumber'               
        'pavucontrol'
        'pamixer'
        'brightnessctl'             
        'udiskie'                   
        'thermald'
        'nftables'

        # DISPLAY MANAGER -----------------------------------------------------
        'ly'
        # 'sddm'
        # 'qt5-quickcontrols'         
        # 'qt5-quickcontrols2'        
        # 'qt5-graphicaleffects'      

        # WINDOW MANAGER ------------------------------------------------------
        'hyprland'                  
        'hyprlock'
        'hypridle'
        'rofi-wayland'                                  
        'dunst'                    
        'swww'                      
        'waybar'                    
        'wl-clipboard'              
        'wf-recorder'               

        # DEPENDENCIES --------------------------------------------------------
        'imagemagick'
        'polkit-kde-agent'          
        'xdg-desktop-portal-hyprland'   
        'qt5-imageformats'          
        'ffmpegthumbs'
        'jq'                              
        'xdg-user-dirs'             
        'stow'
        'python-dbus'                      

        # THEMING -------------------------------------------------------------
        'qt5-wayland'               
        'qt6-wayland'               

        # SHELL ---------------------------------------------------------------
        'zsh'
        'bat'
        'fd'                        
        'fzf'                       
        'thefuck'                   
        'zoxide'                    
        'eza'                       
        'btop'                      

        # FONTS ---------------------------------------------------------------
        'noto-fonts'                
        'ttf-nerd-fonts-symbols'    
        'ttf-nerd-fonts-symbols-common'    
        'ttf-cascadia-code-nerd'           

        # APPLICATIONS --------------------------------------------------------
        'kitty'                 
        'dolphin'
        'ark'
        'firefox'                   
        'github-cli'

        # --------------------------------------------------------------------
        'power-profiles-daemon'
        'cava'
        'slurp'
        'matugen'
        'wayshot'
        'wlogout'
    )

    for package in "${packages[@]}"; do
        echo
        echo "INSTALLING ${package}..."
        $AUR_HELPER -S --needed --noconfirm "$package"
    done
}

_aur() {
    choice=$1
    case $choice in
        1)
            mkdir -p "$HOME"/tmp/
            cd "$HOME"/tmp/ || exit 1
            git clone 'https://aur.archlinux.org/yay.git'
            cd yay && makepkg -si --noconfirm
            ;;
        2)
            mkdir -p "$HOME"/tmp/
            cd "$HOME"/tmp/ || exit 1
            git clone 'https://aur.archlinux.org/paru.git'
            cd paru && makepkg -si --noconfirm
            ;;
    esac
}

# Function to install  apple-sf fonts
_apple_fonts() {
    local font_tmp="$HOME/tmp/apple-sf"
    local font_dir="$HOME/.dotfiles/.local/share/fonts/OTF"
    local fonts=("SF Pro" "SF Serif" "SF Mono")

    echo
    echo "INSTALLING SF-fonts..."

    # Clone the fonts repository
    cd "$HOME" || exit 1
    git clone -n --depth=1 --filter=tree:0 https://github.com/thelioncape/San-Francisco-family.git "$font_tmp"
    cd "$font_tmp" || exit 1

    # Sparse checkout the required fonts
    git sparse-checkout set --no-cone "${fonts[@]}"
    git checkout

    # Create directories and copy fonts
    mkdir -p "$font_dir"/sf-{pro,serif,mono}
    cp "$font_tmp"/SF\ Pro/*.otf "$font_dir"/sf-pro
    cp "$font_tmp"/SF\ Serif/*.otf "$font_dir"/sf-serif
    cp "$font_tmp"/SF\ Mono/*.otf "$font_dir"/sf-mono
}

# MAIN ---------------------------------------------------------------

# Update mirrorlist
upd_mirrors

# Check for system updates
sudo pacman -Syu

# Check and install AUR helper if not installed
if command -v yay &> /dev/null; then
    echo "yay is already installed -- skipping"
elif command -v paru &> /dev/null; then
    echo "paru is already installed -- skipping"
else
    echo "No AUR helper found."
    echo ":: There are 2 available AUR helpers:"
    echo "   1) yay  2) paru"
    echo

    while true; do
        read -rp "Enter a number (default=1): " user_choice

        # If user input is empty, default to option 1
        if [ -z "$user_choice" ]; then
            user_choice=1
        fi

        # Check if the input is a valid choice (1 or 2)
        if [ "$user_choice" = "1" ] || [ "$user_choice" = "2" ]; then
            break  # Exit the loop if valid choice is made
        else
            echo "Invalid choice"
        fi
    done

    # Call function to install AUR helper
    _aur "$user_choice"
fi

# AAAUUURRR
if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
fi

# Install packages
_packages

# Install apple fonts
_apple_fonts

# Copy wallpaper
cp -r "$HOME"/.dotfiles/Pictures "$HOME"

systemctl --user --now enable pipewire pipewire-pulse pipewire-pulse.socket wireplumber
systemctl enable thermald sddm

xdg-user-dirs-update

# Cleanup
rm -rf "$HOME/tmp"

cd "$HOME/.dotfiles" && stow .
