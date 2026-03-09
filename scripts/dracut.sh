#!/bin/bash

paru -Sy --noconfirm --needed dracut

sudo bash -c 'echo "compress=\"zstd\"" >> /etc/dracut.conf.d/myflags.conf'
sudo bash -c 'echo "force_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" >> /etc/dracut.conf.d/myflags.conf'
sudo bash -c 'echo "kernel_cmdline=\"rd.auto rd.lvm=1 rd.dm=1 rd.md=1 rd.luks=1\"" >> /etc/dracut.conf.d/cmdline.conf'
sudo dracut -f --verbose --add-confdir no-network /boot/initramfs-linux.img
sudo rm /boot/initramfs-linux-fallback.img
yay -Rns mkinitcpio --noconfirm
sudo grub-mkconfig -o /boot/grub/grub.cfg
