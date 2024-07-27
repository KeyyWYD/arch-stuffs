#!/bin/bash

_getkey() {
  local key
  IFS= read -rsn1 key

  if [[ $key == $'\x1b' ]]; then
    IFS= read -rsn2 key
    case "$key" in
      '[A') echo "UP" ;;    # Arrow Up
      '[B') echo "DOWN" ;;  # Arrow Down
      '[C') echo "RIGHT" ;; # Arrow Right
      '[D') echo "LEFT" ;;  # Arrow Left
    esac
  elif [[ $key == "" ]]; then
    echo "ENTER"
  else
    echo "$key"
  fi
}
