#!/bin/bash

script_dir="./scripts"

source "$script_dir/colors.sh"
source "$script_dir/input.sh"
source "$script_dir/menu.sh"
source "$script_dir/mirrors.sh"
source "$script_dir/aur.sh"
source "$script_dir/packages.sh"

while true; do
  _menu
  key=$(_getkey)

  case "$key" in
    "UP")
      ((highlight--))
      [[ $highlight -lt 0 ]] && highlight=$((${#_opts[@]} - 1)) ;;
    "DOWN")
      ((highlight++))
      [[ $highlight -ge ${#_opts[@]} ]] && highlight=0 ;;
    "ENTER")
  case "${_opts[$highlight]}" in
    "Mirror Region") _opt1 ;;
    "Aur Helper") _opt2 ;;
    "Additional Packages") _opt3 ;;
    "Install") _opt4 ;;
    "Abort") echo -e "${RED}Exiting...${NC}";sleep 0.5;clear; exit 0 ;;
  esac ;;
esac
done
