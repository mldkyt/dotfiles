
sudo mkdir /etc/pacman.d/hooks
sudo curl -o /etc/pacman.d/hooks/updateKDEcache.hook https://raw.githubusercontent.com/egnrse/updateKDEcache.hook/refs/heads/main/updateKDEcache.hook


yay -S breeze dolphin noto-fonts-{extra,emoji,cjk} lightdm lightdm-gtk-greeter cliphist qt6ct-kde wl-color-picker starship noctalia-shell alacritty xwayland-satellite niri --needed --noconfirm

