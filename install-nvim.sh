#! usr/bin/bash

username=$(id -u -n 1000)

# Prerequisites
sudo apt install ninja-build gettext cmake unzip curl build-essential clang -y

directory="/home/$username/git-repos"

 if [[ ! -d "$directory" ]]; then
    mkdir -p directory 
    chown  $username:$username /home/$username/git-repos
 fi 

cd /home/$username/git-repos
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
