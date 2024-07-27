#!/bin/bash

source colors.sh

helpers=("paru" "yay")  # Small list of AUR helpers
selected_helper=()

_aur() {
  choice=$1

  if command -v yay &> /dev/null; then
      echo "yay is already installed -- skipping"
  elif command -v paru &> /dev/null; then
      echo "paru is already installed -- skipping"
  else
    case $choice in
      yay)
        mkdir -p "$HOME"/tmp/
        cd "$HOME"/tmp/ || exit 1
        git clone 'https://aur.archlinux.org/yay.git'
        cd yay && makepkg -si --noconfirm
        ;;
      paru)
        mkdir -p "$HOME"/tmp/
        cd "$HOME"/tmp/ || exit 1
        git clone 'https://aur.archlinux.org/paru.git'
        cd paru && makepkg -si --noconfirm
        ;;
    esac
  fi
}

_aurselect() {
  clear
  echo -e "${BOLD}${WHITE}Select an AUR helper to install packages from"
  echo -e "${CYAN}${BOLD}╭───────────────────────────────────────╮"
  echo -e "│ ${WHITE}${BOLD}          Select AUR Helper           ${CYAN}${BOLD}│"
  echo -e "├───────────────────────────────────────┤${NC}"

  local i
  local width=34
  for i in "${!helpers[@]}"; do
    local checkbox
    if [[ " ${selected_helper[@]} " =~ " ${helpers[$i]} " ]]; then
      checkbox="${GREEN}${BOLD}[*]${NC}"
    else
      checkbox="${RED}[ ]${NC}"
    fi
    local paddme=$(printf "%-${width}s" "${helpers[$i]}")
    if [[ $i -eq $highlight ]]; then
      echo -e "${CYAN}${BOLD}│ ${BOLD}${checkbox} ${YELLOW}$paddme${CYAN}${BOLD}│${NC}"
    else
      echo -e "${CYAN}│ ${checkbox} $paddme${CYAN}${BOLD}│${NC}"
    fi
  done

  echo -e "${CYAN}${BOLD}├───────────────────────────────────────┤"
  echo -e "│ ${WHITE}${BOLD}[Enter] Select/Deselect${CYAN}${BOLD}               │"
  echo -e "│ ${WHITE}${BOLD}[q] Main Menu${CYAN}${BOLD}                         │"
  echo -e "╰───────────────────────────────────────╯${NC}"
}

_selectaur() {
  local key

  while true; do
    _aurselect
    key=$(_getkey)

    case "$key" in
    "UP")
      ((highlight--))
      [[ $highlight -lt 0 ]] && highlight=$((${#helpers[@]} - 1)) ;;
    "DOWN")
      ((highlight++))
      [[ $highlight -ge ${#helpers[@]} ]] && highlight=0 ;;
    "ENTER")
      local selected=${helpers[$highlight]}
      # Select the new helper and deselect any previously selected one
      selected_helper=("$selected");;
    "q")
      break ;;
    esac
  done
}
