
# Install apt
sudo apt install tmux nitrogen lxappearance stow alacritty btop rofi picom wget neofetch vim unzip libxcb-xfixes0-dev -y

# Install themes
sudo apt install orchis-gtk-theme oxygencursors arc-theme papirus-icon-theme -y

# Install Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.chromium.Chromium

# Install Rost and Cargo
curl https://sh.rustup.rs -sSf | sh
