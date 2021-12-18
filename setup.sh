#!/bin/bash

./scripts/install-apps.sh
./scripts/install-symlink.sh
#./scripts/install-configs.sh

# Get all upgrades
sudo apt upgrade -y

# See our shell changes
chsh -s $(which zsh)
source ~/.zshrc

# Fun hello
figlet "... and we're back!" | lolcat
