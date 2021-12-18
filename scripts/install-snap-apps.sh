#!/bin/bash

sudo apt install snapd

PKGS=(
  authy
)

for pkg in "${PKGS[@]}"; do
  echo_info "Installing ${pkg}..."
  if ! [ -x "$(command -v rainbow)" ]; then
    sudo snap install "$pkg"
  else
    rainbow --red=error --yellow=warning snap install "$pkg"
  fi
  echo_done "${pkg} installed!"
done
