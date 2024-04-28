#! usr/bin/bash

# Check if Script is Run as Root
#if [[ $EUID -ne 0 ]]; then
 # echo "You must be a root user to run this script, please run sudo ./install-setup.sh" 2>&1
 # exit 1
#fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
sudo apt update
sudo apt upgrade -y

# Check if directory existence

mkdir -p "/home/$username/.config/nvim"
mkdir -p "/home/$username/.config/alacritty"
mkdir -p "/home/$username/.config/btop"
mkdir -p "/home/$username/.config/rofi"
mkdir -p "/home/$username/.config/tmux"
mkdir -p "/home/$username/.config/lazygit"
mkdir -p "/home/$username/.config/nitrogen"
mkdir -p "/home/$username/.local/share/fonts"
mkdir -p "/home/$username/Pictures"
mkdir -p "/home/$username/Music"
mkdir -p "/home/$username/Videos"
mkdir -p "/home/$username/Documents"
mkdir -p "/home/$username/Projekts"
mkdir -p "/home/$username/git-repos"
mkdir -p "/home/$username/.config/awesome"
mkdir -p "/home/$username/.config/.oh-my-bash"

# Clone github repo
#cd /home/$username/
git clone https://github.com/tobi9090/dotfiles.git /home/$username/dotfiles
git clone https://github.com/tobi9090/fonts.git /home/$username/.local/share/fonts

mv /home/$username/.bashrc /home/$username/.oldbashrc
# stow dotfiles
cd /home/$username/dotfiles

stow -S .
chown -R $username:$username /home/$username

# Install packges for desktop setup
sudo apt install awesome sddm-theme-debian-maui -y

# Config Sddm to run on next login
sudo dpkg-reconfigure sddm

# Install apt
sudo apt install tmux nitrogen stow alacritty btop rofi picom wget neofetch vim unzip libxcb-xfixes0-dev -y

sudo chmod +x ${builddir}/install-nvim.sh
sudo sh ${builddir}/install-nvim.sh

# Install Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.chromium.Chromium
