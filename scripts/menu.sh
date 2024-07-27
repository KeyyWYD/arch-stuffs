#!/bin/bash

# Vars
highlight=0

source colors.sh

_highlight() {
  local highlight=$1
  local items=("${@:2}")
  for i in "${!items[@]}"; do
    if [ "$i" -eq "$highlight" ]; then
      echo -e " ${YELLOW}${items[$i]}${NC}"
    else
      echo -e " ${items[$i]}"
    fi
  done
}

# Menu
_opts=("Mirror Region" "Aur Helper" "Additional Packages" "Install" "Abort")

_header() {
  clear
  echo -e "${CYAN}${BOLD}╭───────────────────────────────╮"
  echo -e "│    ${WHITE}Arch Post Install Script${CYAN}   │"
  echo -e "╰───────────────────────────────╯${NC}"
}

_menu() {
  _header
  _highlight $highlight "${_opts[@]}"
  # echo -e "${CYAN}─────────────────────────────────${NC}"
  echo

  local width=27
  if [ ${#additional[@]} -gt 0 ]; then
    echo -e "${CYAN}${BOLD}╭───────────────────────────────╮"
    echo -e "│ ${WHITE}Additional packages:${CYAN}          │"

  for package in "${additional[@]}"; do
    local padded=$(printf "%-${width}s" "$package")
    echo -e "│    ${YELLOW}$padded${CYAN}│"
  done

  echo -e "${CYAN}╰───────────────────────────────╯${NC}"
  fi
}

# Options
_opt1() {
  clear
  _selectmirrors

  if [ ${#selected_regions[@]} -eq 0 ]; then
    echo -e "${RED}No region(s) selected. The mirrorlist will not be updated.${NC}"
  else
    _createurl
  fi
}

_opt2() {
  clear
  _selectaur
}

_opt3() {
  clear
  _optpackages
}

_opt4() {
  clear

  # Update mirrorlist
  _updmirrors

  # Check for system updates
  sudo pacman -Syu

  # Install aur helper
  _aur "$selected_helper"

  # Set default aur helper
  if command -v yay &> /dev/null; then
    aurhelper="yay"
  elif command -v paru &> /dev/null; then
    aurhelper="paru"
  fi

  # Install main packages
  _pkg

  # Apple fonts
  _apple_fonts

  # Enable Services
  systemctl --user --now enable pipewire pipewire-pulse pipewire-pulse.socket wireplumber
  systemctl enable thermald sddm
  xdg-user-dirs-update

  # Copy wallpaper
  cp -r "$HOME"/.dotfiles/Pictures "$HOME"

  # Finalizing
  rm -rf "$HOME/tmp"
  cd "$HOME/.dotfiles" && stow .
}
