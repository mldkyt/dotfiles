#!/bin/bash

paru -Sy vlc vlc-plugins-all kdenlive libreoffice-fresh uv git obs-studio discord vencord-installer-bin steam qbittorrent wine-staging docker docker-compose docker-buildx php reflector nmap bind sshfs kdeconnect btop noto-fonts-{extra,emoji,cjk} krita teams-for-linux-bin ttf-jetbrains-mono-nerd hyfetch gwenview ark partitionmanager zip unzip downgrade nvm syncthing obsidian prismlauncher catppuccin-plasma-colorscheme-mocha catppuccin-gtk-theme-mocha --noconfirm --needed

sudo VencordInstaller
sudo downgrade --ignore always --latest libxkbcommon=1.11.0-1 libxkbcommon-x11=1.11.0-1
sudo systemctl enable docker.socket
systemctl --user enable --now syncthing
sudo usermod -aG docker $USER
git config --global user.name "lain/lunya"
git config --global user.email lunya@murena.io
git config --global commit.gpgSign true
git config --global tag.gpgSign true
git config --global user.signingkey 458591AD4C4C0233
git config --global credential.helper libsecret

echo "source /usr/share/nvm/init-nvm.sh" >> ~/.zshrc
source /usr/share/nvm/init-nvm.sh
nvm install 22
nvm use 22
corepack enable
