
#!/bin/bash

sudo xbps-install axel wget vlc kdenlive libreoffice libreoffice-kde uv git obs steam qbittorrent wine wine-{gecko,mono} winetricks ffmpeg docker docker-{compose,buildx} php nmap bind fuse-sshfs kdeconnect btop krita gwenview ark partitionmanager zip unzip PrismLauncher 7zip kcalc handbrake pycharm-community easyeffects yt-dlp blender kompare godot sqlitebrowser -y

# Custom packages
# This is a really stupid way to do this but I can't be bothered

# Gram

mkdir -p pkg/gram
pushd pkg/gram

axel https://codeberg.org/GramEditor/gram/releases/download/1.2.1/gram-linux-x86_64-1.2.1.tar.gz
sync
tar -xvf gram-linux-x86_64-1.2.1.tar.gz
rm gram-linux-x86_64-1.2.1.tar.gz
mv gram.app usr
rm usr/license.md
xbps-create -A x86_64 -n gram-1.2.1_1 -s "Gram code editor" .
xbps-rindex -a *
sudo xbps-install -R . gram -y

popd

# Hyfetch (Mandatory)

mkdir -p pkg/hyfetch
python -m venv .venv
.venv/bin/pip install hyfetch
mkdir -p usr/lib/python3.14/site-packages usr/bin
cp -r .venv/lib/python3.14/site-packages/hyfetch* usr/lib/python3.14/site-packages
cp .venv/bin/hyfetch usr/bin/hyfetch
rm -rf .venv

xbps-create -A x86_64 -n hyfetch-2.0.5_1 -s "Neofetch with pride flags" .
xbps-rindex -a *
sudo xbps-install -R . hyfetch -y

popd

# Free Download Manager

mkdir -p pkg/free-download-manager
pushd pkg/free-download-manager
axel https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
ar x freedownloadmanager.deb
rm freedownloadmanager.deb debian-binary
tar -xvf control.tar.xz
rm postinst
version=$(cat control | grep Version: | cut -d " " -f 2)
rm control
tar -xvf data.tar.xz
rm -rf etc/ data.tar.xz control.tar.xz

xbps-create -A x86_64 -n "freedownloadmanager-${version}_1" -s "Free Download Manager" .
xbps-rindex -a *
sudo xbps-install -R . freedownloadmanager -y

popd

# Teams for Linux

mkdir -p pkg/teams-for-linux
pushd pkg/teams-for-linux
axel https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v2.8.0/teams-for-linux_2.8.0_amd64.deb
ar x teams-for-linux_2.8.0_amd64.deb
rm teams-for-linux_2.8.0_amd64.deb debian-binary control.tar.xz
tar -xJfv data.tar.xz
rm data.tar.xz
mkdir -p usr/bin
ln -s opt/teams-for-linux/teams-for-linux usr/bin/teams-for-linux

xbps-create -A x86_64 -n "teams-for-linux-2.8.0_1" -s "Teams for Linux" .
xbps-rindex -a *
sudo xbps-install -R . teams-for-linux -y

popd

# Config rest

sudo usermod -aG docker $USER
git config --global user.name "Lunya 🏳<fe0f><200d>⚧<fe0f> :3"
git config --global user.email lunya@murena.io
git config --global commit.gpgSign true
git config --global tag.gpgSign true
git config --global user.signingkey 458591AD4C4C0233
git config --global credential.helper libsecret
