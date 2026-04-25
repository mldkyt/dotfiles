#!/bin/bash

# Attempt to install DE.


sudo xbps-install -S kde-plasma kde-baseapps xorg sddm NetworkManager plasma-nm -y

# Enable services.
sudo sv stop dhcpcd
sudo sv stop dhcpcd
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/dbus/ /var/service
sudo sv start dbus
sudo ln -s /etc/sv/sddm/ /var/service
sudo ln -s /etc/sv/NetworkManager/ /var/service
sudo sv start NetworkManager

# Install driver nvidia
sudo xbps-install void-repo-nonfree -y
sudo xbps-install -Su
sudo xbps-install nvidia -y
sudo xbps-install qt5-wayland qt6-wayland kwayland -y

# Update some configs (wayland)

sudo sed -i "s/loglevel=4/loglevel=4 nvidia-drm.modeset=1" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo bash -c 'echo "force_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" >> /etc/dracut.conf.d/myflags.conf'

# Audio

sudo xbps-install pipewire -y

sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

sudo ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart/
sudo ln -s /usr/share/applications/pipewire-pulse.desktop /etc/xdg/autostart/

# Fonts

sudo xbps-install adwaita-fonts noto-fonts-{cjk,emoji} -y

echo "Reconfigure the linux*.* package"
