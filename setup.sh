#!/usr/bin/env bash

#
# Arch Linux Post Install Script (For Clean Install)
# 

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

# Function to install packages
install_packages() {
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
        'qt5-quickcontrols'         
        'qt5-quickcontrols2'        
        'qt5-graphicaleffects'      

        # WINDOW MANAGER ------------------------------------------------------
        'hyprland'                  
        'hyprlock'
        'hypridle'
        'rofi-wayland'              
        'swappy'                    
        'swaync'                    
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
        'mesa-utils'                
        'xdg-user-dirs'             
        'stow'                      

        # THEMING -------------------------------------------------------------
        'qt5-wayland'               
        'qt6-wayland'               

        # SHELL ---------------------------------------------------------------
        'zsh'                       
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
        'ttf-jetbrains-mono-nerd'   
        'ttf-mononoki-nerd'         
        'ttf-dejavu'                
        'ttf-fira-code'             
        'ttf-firacode-nerd'         
        'ttf-font-awesome'          
        'ttf-iosevka-nerd'          

        # APPLICATIONS --------------------------------------------------------
        'alacritty'                 
        'dolphin'
        'ark'
        'firefox'                   
        'github-cli'

        # --------------------------------------------------------------------
        'auto-cpufreq'
        'cava'
        'sddm-git'
        'slurp'
        'wallust-git'
        'wayshot'
        'wlogout'
    )

    for package in "${packages[@]}"; do
        echo
        echo "INSTALLING ${package}..."
        $AUR_HELPER -S --needed --noconfirm "$package"
    done
}

install_aur() {
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
install_apple_fonts() {
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

# Check for system updates
sudo pacman -Syu

cat << "EOF"


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ██╗███╗   ██╗ ██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██║████╗  ██║██╔════╝ 
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ██║██╔██╗ ██║██║  ███╗
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██║██║╚██╗██║██║   ██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║██║ ╚████║╚██████╔╝
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                             NECESSARY COMPONENTS


EOF

# Check and install AUR helper if not installed
if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
    echo "yay is already installed -- skipping"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
    echo "paru is already installed -- skipping"
else
    echo "No AUR helpers found."
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
    install_aur "$user_choice"
fi

# Install packages
install_packages

# Install apple fonts
install_apple_fonts

# Copy wallpaper
cp -r "$HOME"/.dotfiles/Pictures "$HOME"

cat << "EOF"


 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ██╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ 
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██║   ██║██╔══██╗██║████╗  ██║██╔════╝ 
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗██║   ██║██████╔╝██║██╔██╗ ██║██║  ███╗
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║██║   ██║██╔══██╗██║██║╚██╗██║██║   ██║
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝╚██████╔╝██║  ██║██║██║ ╚████║╚██████╔╝
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                                      SERVICES
                                                                                                                                                      

EOF

sudo auto-cpufreq --install
systemctl --user --now enable pipewire pipewire-pulse pipewire-pulse.socket wireplumber
systemctl enable thermald auto-cpufreq sddm

# Cleanup
rm -rf "$HOME/tmp"

cd "$HOME/.dotfiles" && stow .

cat << "EOF"


██████╗  ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔═══██╗████╗  ██║██╔════╝
██║  ██║██║   ██║██╔██╗ ██║█████╗  
██║  ██║██║   ██║██║╚██╗██║██╔══╝  
██████╔╝╚██████╔╝██║ ╚████║███████╗
╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝
----- Reboot to apply changes -----


EOF
