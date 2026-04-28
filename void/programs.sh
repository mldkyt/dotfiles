#!/bin/bash

sudo xbps-install void-repo-multilib void-repo-multlib-nonfree -y

sudo xbps-install -S zstd axel wget vlc kdenlive libreoffice libreoffice-kde uv git obs steam libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit libva-32bit nvidia-libs-32bit qbittorrent wine wine-{gecko,mono} winetricks ffmpeg docker docker-{compose,buildx} php nmap bind fuse-sshfs kdeconnect btop krita gwenview ark partitionmanager zip unzip PrismLauncher 7zip kcalc handbrake pycharm-community easyeffects yt-dlp blender kompare godot sqlitebrowser  -y

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
sync
xbps-rindex -a *
sync
sudo xbps-install -R . gram -y

popd

# Hyfetch (Mandatory)

mkdir -p pkg/hyfetch
pushd pkg/hyfetch
curl -LOJ https://archlinux.org/packages/extra/x86_64/hyfetch/download/
version=$(ls *.pkg.tar.zst | cut -d "-" -f 2)
tar -xvf *.pkg.tar.zst
rm *.pkg.tar.zst .*

xbps-create -A x86_64 -n hyfetch-2.0.5_1 -s "Neofetch with pride flags" .
sync
xbps-rindex -a *
sync
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
sync
xbps-rindex -a *
sync
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
sync
xbps-rindex -a *
sync
sudo xbps-install -R . teams-for-linux -y

popd

# Flatpaks

sudo xbps-install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flatseal -y

# Config rest

sudo usermod -aG docker $USER
git config --global user.name "Lunya 🏳<fe0f><200d>⚧<fe0f> :3"
git config --global user.email lunya@murena.io
git config --global commit.gpgSign true
git config --global tag.gpgSign true
git config --global user.signingkey 458591AD4C4C0233

if [[ ! -f ~/.config/environment.d/git_askpass.conf ]];
then
    mkdir -p ~/.config/environment.d/
    echo "GIT_ASKPASS=/usr/bin/ksshaskpass" >> ~/.config/environment.d/git_askpass.conf
fi

cat ~/.bashrc | grep "export GIT_ASKPASS=ksshaskpass"
if [[ $? -ne 0 ]];
then
    echo "export GIT_ASKPASS=ksshaskpass" >> ~/.bashrc
fi

cat ~/.zshrc | grep "export GIT_ASKPASS=ksshaskpass"
if [[ $? -ne 0 ]];
then
    echo "export GIT_ASKPASS=ksshaskpass" >> ~/.bashrc
fi

if [[ ! -f ~/.config/environment.d/ssh_askpass.conf ]];
then
    mkdir -p ~/.config/environment.d/
    echo "SSH_ASKPASS=/usr/bin/ksshaskpass" >> ~/.config/environment.d/ssh_askpass.conf
fi

cat ~/.bashrc | grep "export SSH_ASKPASS=ksshaskpass"
if [[ $? -ne 0 ]];
then
    echo "export SSH_ASKPASS=ksshaskpass" >> ~/.bashrc
fi

cat ~/.zshrc | grep "export SSH_ASKPASS=ksshaskpass"
if [[ $? -ne 0 ]];
then
    echo "export SSH_ASKPASS=ksshaskpass" >> ~/.bashrc
fi

read -p "setup vr? [y/N]" vr

if [[ "$vr" = "y" ]]
then
    flatpak install wivrn
    sudo xbps-install -y avahi
    sudo ln -s /etc/sv/avahi-daemon /var/service
    sudo sv start avahi-daemon

    mkdir -p pkg/xrizer
    pushd pkg/xrizer
    axel https://github.com/Supreeeme/xrizer/releases/download/v0.5/xrizer-v0.5.zip
    7z x xrizer-v0.5.zip
    rm xrizer-v0.5.zip
    mkdir -p usr/lib
    mv xrizer-v0.5/bin/linux64/vrclient.so usr/lib/vrclient.so
    rm -rf xrizer-v0.5

    xbps-create -A x86_64 -n "xrizer-0.5_1" -s "VR client" .
    sync
    xbps-rindex -a *
    sync
    sudo xbps-install -R . xrizer -y

    popd
fi
