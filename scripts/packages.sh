#!/bin/bash

source colors.sh

_optpackages() {
  clear
  echo -e "${CYAN}${BOLD}╭──────────────────────────────────────╮"
  echo -e "│         ${WHITE}Additional Packages${CYAN}          │"
  echo -e "├──────────────────────────────────────┤"
  echo -e "│ ${WHITE}If you desire packages not shipped${CYAN}   │"
  echo -e "│ ${WHITE}with this script, specity in the${CYAN}     │"
  echo -e "│ ${WHITE}following prompt. Write additional${CYAN}   │"
  echo -e "│ ${WHITE}packages to install (space separated,${CYAN}│"
  echo -e "│ ${WHITE}leave blank to skip)${CYAN}                 │"
  echo -e "${BOLD}├──────────────────────────────────────┤"
  echo -e "│ ${WHITE}Press [Enter] Finish${CYAN}                 │"
  echo -e "╰──────────────────────────────────────╯${NC}"

  read -p "Enter packages: " -r input
  additional=($input)
}

pkg_dir=$(pwd)
pkg_file="$pkg_dir/scripts/packages.lst"

if [ ! -f "$pkg_file" ]; then
  echo "Error: File '$pkg_file' not found!"
fi

_pkg() {
  packages=()

  while IFS= read -r line; do
    if [[ -n "$line" && ! "$line" =~ ^# ]]; then
      packages+=("$line")
    fi
  done < "$pkg_file"

  if [ ${#packages[@]} -eq 0 ]; then
    echo "No packages listed in '$pkg_file'."
  else
    # Base Packages
    for pkg in "${packages[@]}"; do
      echo
      echo "INSTALLING ${pkg}..."
      $aurhelper -S --needed --noconfirm "$pkg"
    done
  fi

  if [ ${#additional[@]} -eq 0 ]; then
    return
  else
    # Additional Packages
    for apkg in "${additional[@]}"; do
      echo
      echo "INSTALLING ${apkg}..."
      $aurhelper -S --needed --noconfirm "$apkg"
    done
  fi
}

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
