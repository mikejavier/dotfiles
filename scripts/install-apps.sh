#!/bin/bash

# ----------------------------------------------------------------------
# | Add repos                                                          |
# ----------------------------------------------------------------------
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo add-apt-repository universe
sudo add-apt-repository ppa:agornostal/ulauncher
sudo add-apt-repository ppa:serge-rider/dbeaver-ce

# ----------------------------------------------------------------------
# | Update sources                                                     |
# ----------------------------------------------------------------------

sudo apt update -y

# ----------------------------------------------------------------------
# | Install utils                                                       |
# ----------------------------------------------------------------------
wget -O- https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh | bash
wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ----------------------------------------------------------------------
# | Install apps                                                       |
# ----------------------------------------------------------------------
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
wget -c https://downloads.slack-edge.com/releases/linux/4.21.1/prod/x64/slack-desktop-4.21.1-amd64.deb -O slack.deb
wget -c https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb -O teams.deb
wget -c https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb
wget -c https://discord.com/api/download?platform=linux&format=deb -O discord.deb

# yt-dlp
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
chmod a+rx /usr/local/bin/yt-dlp

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install zsh
install wget
install apt-transport-https 
install curl
install exfat-utils
install file
install git
install openconnect
install htop
#install gnome-tweak-tool
#install gnome-shell-extensions
#install chrome-gnome-shell

# Applications
install brave-browser
install cheese
install flameshot
install baobab
install gparted
install simplescreenrecorder
install vlc
install ulauncher
install spotify-client
install dbeaver-ce
install ../slack.deb
install ../teams.deb
install ../zoom.deb
install ../discord.deb
./install-docker.sh
./install-vscode.sh
./install-snap-apps.sh

# Fun stuff
install figlet
install lolcat

