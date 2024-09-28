
username=$(id -u -n 1000)

# Install packges for desktop setup
sudo apt install make xorg libxcb-xfixes0-dev sddm -y

## Added sddm themes
# sudo apt install qml-module-qtquick-window2 qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6
# sudo cp -r ${builddir}/catppuccin-macchiato /usr/share/sddm/themes/
# sudo touch /etc/sddm.conf

# For Test themes
# sddm-greeter --test-mode --theme /usr/share/sddm/themes/<name for theme>

# Added the to sddm.conf
# [Theme]
# Current=catppuccin-macchiato



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
