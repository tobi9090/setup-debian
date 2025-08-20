
username=$(id -u -n 1000)

# Wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# VsCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Wine
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
# For bookworm
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

sudo apt update

# LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin


# Install apt
sudo apt install tmux nitrogen lxappearance stow alacritty btop rofi picom wget neofetch vim unzip libxcb-xfixes0-dev network-manager wezterm pulseaudio pavucontrol pavucontrol code fzf mpv virt-manager qemu-system-x86 qemu-utils libvirt-daemon-system p7zip-full xclip lua5.1 ripgrep -y

sudo apt install --install-recommends winehq-stable -y

# Maybe in the future
# sudo apt install pipewire pipewire-audio-client-libraries pipewire-audio wireplumber pipewire-pulse
# systemctl --user --now enable wireplumber.service
## https://wiki.debian.org/PipeWire ##

systemctl --user restart pulseaudio.service
sudo usermod --append --groups libvirt $username



# Install themes
sudo apt install orchis-gtk-theme oxygencursors arc-theme papirus-icon-theme -y

# Install Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.chromium.Chromium

# Install Rost and Cargo
curl https://sh.rustup.rs -sSf | sh

# File Manager
cargo install --locked yazi-fm yazi-cli

