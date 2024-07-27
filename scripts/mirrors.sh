#!/bin/bash

source colors.sh

regions=( "AU"  "DE" "FR" "GB" "JP" "ID" "RU" "US")  # Small list of regions
selected_regions=()  # Array to hold selected regions

is_installed() {
  local pkg=$1

  if sudo pacman -Qi "${pkg}" &> /dev/null; then
    return 0
  else
    return 1
  fi
}

_mirrorselect() {
  clear
  echo -e "${BOLD}${WHITE}Select region(s) to install packages from${NC}"
  echo -e "${CYAN}${BOLD}╭───────────────────────────────────────╮"
  echo -e "│ ${WHITE}${BOLD}          Select Region(s)            ${CYAN}${BOLD}│"
  echo -e "├───────────────────────────────────────┤${NC}"

  local i
  for i in "${!regions[@]}"; do
    local checkbox
    if [[ " ${selected_regions[@]} " =~ " ${regions[$i]} " ]]; then
      checkbox="${GREEN}${BOLD}[*]${NC}"
    else
      checkbox="${RED}[ ]${NC}"
    fi
    if [[ $i -eq $highlight ]]; then
      echo -e "${CYAN}${BOLD}│ ${BOLD}${checkbox} ${YELLOW}${regions[$i]}${NC}"
    else
      echo -e "${CYAN}│ ${checkbox} ${regions[$i]}${NC}"
    fi
  done

  echo -e "${CYAN}${BOLD}├───────────────────────────────────────┤"
  echo -e "│ ${WHITE}${BOLD}Press [Enter] Select/Deselect${CYAN}${BOLD}      │"
  echo -e "│ ${WHITE}${BOLD}Press [q] Main Menu${CYAN}${BOLD}                     │"
  echo -e "╰───────────────────────────────────────╯${NC}"
}


# Handle mirror selection
_selectmirrors() {
    local highlight=0
    local key

while true; do
    _mirrorselect
    key=$(_getkey)

    case "$key" in
      "UP")
        ((highlight--))
        [[ $highlight -lt 0 ]] && highlight=$((${#regions[@]} - 1)) ;;
      "DOWN")
        ((highlight++))
        [[ $highlight -ge ${#regions[@]} ]] && highlight=0 ;;
      "ENTER")
        local region=${regions[$highlight]}
        if [[ " ${selected_regions[@]} " =~ " ${region} " ]]; then
        selected_regions=("${selected_regions[@]/$region/}")
        else
        selected_regions+=("$region")
        fi ;;
      "q")
      break ;;
    esac
  done
}

# Construct the URL based on selected mirrors
_createurl() {
  local base_url="https://archlinux.org/mirrorlist/?"
  local params=()

  for region in "${selected_regions[@]}"; do
    params+=("country=${region}")
  done

  if [ ${#params[@]} -eq 0 ]; then
    url="${base_url}protocol=https&ip_version=6&use_mirror_status=on"
  else
    local param=$(IFS='&'; echo "${params[*]}")
    url="${base_url}${param}&protocol=https&ip_version=6&use_mirror_status=on"
  fi
}

_updmirrors() {

  local backup_dir="/etc/pacman.d"
  local backup_prefix="mirrorlist"
  local backup_ext=".bak"
  local backup_num=1
  local backup_file

  if [ ${#selected_regions[@]} -eq 0 ]; then
    return
  fi

  _createurl

  echo
  echo -e Updating mirrorlist...

  # Install pacman-contrib package
  if is_installed "pacman-contrib"; then
    sleep 0.1
  else
    echo -e `pacman-contrib` not found. INSTALLING...
    sudo pacman -S --noconfirm pacman-contrib
  fi

  # Check if a backup file already exists
  if [ -f "${backup_dir}/${backup_prefix}${backup_ext}" ]; then
    # Find the next available backup number
    while [ -f "${backup_dir}/${backup_prefix}(${backup_num})${backup_ext}" ]; do
      ((backup_num++))
    done
    backup_file="${backup_dir}/${backup_prefix}(${backup_num})${backup_ext}"
  else
    backup_file="${backup_dir}/${backup_prefix}${backup_ext}"
  fi

  # Create the backup
  if [ -f "/etc/pacman.d/mirrorlist" ]; then
    echo -e Creating backup "${backup_file}"...
    sudo cp /etc/pacman.d/mirrorlist "$backup_file"
  fi

# Fetch, rank mirrors, and update mirrorlist
  echo -e Updating mirrorlist...
  sudo curl -s "${url}" \
  | sed -e "s/^#Server/Server/" -e "/^#/d" \
  | rankmirrors -n 6 - | sudo tee /etc/pacman.d/mirrorlist

  echo -e Mirrorlist updated successfully.
  sleep 0.5
}