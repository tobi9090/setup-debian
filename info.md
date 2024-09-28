# format disk

## See all disks
### sudo fdisk -l

## Delete ALL data on disk 
### sudo dd if=/dev/zero of=/dev/<disk-name> bs=4k status=progress && sync

## To format disk use fdisk
### Search Web for new :)


## Added label to ext4 disk 
### sudo e2label /dev/<disk-name> <label-name>

# Install Steam
## Follow Debian Steam guide at https://wiki.debian.org/Steam
## Gamemode add < gamemoderun %command% > to steam Launch Options

Added deb "http://deb.debian.org/debian bookworm main contrib non-free-firmware" to /etc/apt/sources.list
sudo apt update
sudo apt install firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all

## 32-bit support
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

## Steam Installer
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
sudo apt install steam-installer 


## Troubleshooting - Steam runtime issues

rm ~/.steam/debian-installation/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6
rm ~/.steam/debian-installation/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu/libgcc_s.so.1
rm ~/.steam/debian-installation/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libgcc_s.so.1
rm ~/.steam/debian-installation/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libstdc++.so.6
rm ~/.steam/debian-installation/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libxcb.so.1
rm ~/.steam/debian-installation/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu/libgpg-error.so.0

Examples of issues / error messages known to occur if these libraries are present:

Failed to load libGL: undefined symbol: xcb_send_fd
ERROR: ld.so: object '~/.local/share/Steam/ubuntu12_32/gameoverlayrenderer.so' from LD_PRELOAD cannot be preloaded (wrong ELF class: ELFCLASS32): ignored.
Problems with 64-bit games like XCOM
"OpenGL GLX context is not using direct rendering, which may cause performance problems." (see below)
"Could not find required OpenGL entry point 'glGetError'! Either your video card is unsupported or your OpenGL driver needs to be updated."
The Steam client itself crashing <------

# Path of exile error
## vk:: createInstanceUnique ErrorExtensionNotPresent 
### Find production_Config.ini and change to renderer_type=DirectX12
/home/tobias/Games/SteamLibrary/steamapps/compatdata/238960/pfx/dosdevices/c:/users/steamuser/Documents/My Games/Path of Exile/production_Config.ini

## Preventing screen tearing
echo > /etc/X11/xorg.conf.d/20-amdgpu.conf <<EOF
Section "Device"
   Identifier  "AMD Graphics"
   Driver      "amdgpu"
   Option      "TearFree"  "true"
EndSection
EOF

## fstap config

# /Games is on /dev/nvme0n1p1
UUID=a8dd8612-f1e6-4769-ab9a-ad76c9024dfd /home/tobias/Games ext4 defaults 0 3

# /Personal is on /dev/sda1
UUID=6f6218fd-ff5b-4b54-b6e6-a116767a4f73 /home/tobias/Personal ext4 defaults 0 4