#!/bin/bash

paru -Sy haruna kdenlive libreoffice-fresh uv git obs-studio discord vencord-installer-bin steam qbittorrent wine wine-{gecko,mono} ffmpeg docker docker-{buildx,compose} php reflector nmap bind sshfs kdeconnect btop noto-fonts-{extra,emoji,cjk} krita teams-for-linux-bin ttf-jetbrains-mono-nerd hyfetch gwenview ark 7zip partitionmanager zip unzip downgrade nvm prismlauncher librewolf-bin gram rar kcalc handbrake fluxer-bin pycharm prusa-slicer easyeffects yt-dlp parabolic blender godot hyfetch fastfetch tenacity rar epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 sqlitebrowser gram xclicker --noconfirm --needed
paru -Sy phantomjs python-{xattr,brotli,websockets,pycryptdome,mutagen,curl_cffi} aria2 atomicparsley kimageformats lsp-plugins calf zam-plugins --needed --asdeps --noconfirm

sudo VencordInstaller
sudo downgrade --ignore always --latest libxkbcommon=1.11.0-1 libxkbcommon-x11=1.11.0-1
sudo systemctl enable docker.socket
sudo usermod -aG docker $USER
git config --global user.name "Lunya 🏳️‍⚧️ :3"
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


cat <<EOF | sudo tee /etc/polkit-1/rules.d/00-udisks.rules
// Allow user to mount devices without authentication; anything else is too annoying.

polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" || action.id == "org.freedesktop.udisks2.filesystem-mount") && subject.local && subject.active) {
        return polkit.Result.YES;
        te});
EOF
cat <<EOF | sudo tee /etc/polkit-1/rules.d/00-ntp-and-time-zones.rules
// Allow current user or their system services to change the system time zone and time
// synchronization. This effectively fixes https://bugs.kde.org/show_bug.cgi?id=490899

polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.timedate1.set-timezone" || action.id == "org.freedesktop.timedate1.set-ntp") && subject.local && subject.active && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
EOF
cat <<EOF | sudo tee /etc/polkit-1/rules.d/00-open-firewall-kcm.rules
// Allow current user to open the firewall KCM without being immediately prompted
// to authenticate.

polkit.addRule(function(action, subject) {
    if (action.id == "org.kde.ufw.queryapps" && subject.local && subject.active && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
EOF
sudo chown root:polkitd /etc/polkit-1/rules.d/00-udisks.rules /etc/polkit-1/rules.d/00-ntp-and-time-zones.rules /etc/polkit-1/rules.d/00-open-firewall-kcm.rules
sudo systemctl reload polkit
