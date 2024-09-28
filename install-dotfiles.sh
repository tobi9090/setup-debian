
username=$(id -u -n 1000)
builddir=$(pwd)


# Clone github repo
#cd /home/$username/
git clone https://github.com/tobi9090/dotfiles.git /home/$username/dotfiles
git clone https://github.com/tobi9090/fonts.git /home/$username/.local/share/fonts

mv /home/$username/.bashrc /home/$username/.oldbashrc
# stow dotfiles
cd /home/$username/dotfiles

stow .
chown -R $username:$username /home/$username/dotfiles

