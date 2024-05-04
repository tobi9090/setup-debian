
username=$(id -u -n 1000)

# Install packges for desktop setup
sudo apt install make xorg libxcb-xfixes0-dev sddm-theme-debian-maui -y

# Config Sddm to run on next login
sudo dpkg-reconfigure sddm

cd /home/$username
sudo apt build-dep awesome
git clone https://github.com/awesomewm/awesome
cd awesome
make package
cd build
sudo apt install ./*.deb

sudo mkdir /usr/share/xsessions
sudo cp ${builddir}/awesome.desktop /usr/share/xsessions/

rm -rf /home/$username/awesome
