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

sudo cp ${builddir}/awesome.desktop /usr/share/xsessions/

sudo cp ${builddir}/20-amd.conf /etc/X11/xorg.conf.d/

chmod +x ${builddir}/install-dotfiles.sh
sh ${builddir}/install-dotfiles.sh

chmod +x ${builddir}/install-desktop.sh
sh ${builddir}/install-desktop.sh

chmod +x ${builddir}/install-nvim.sh
sh ${builddir}/install-nvim.sh

chmod +x ${builddir}/install-apps.sh
sh ${builddir}/install-apps.sh

