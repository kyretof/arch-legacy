#!/bin/bash

#Time zone
ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
hwclock --systohc

#Localization
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

#Network configuration
echo "arch" >> /etc/hostname

echo "127.0.0.1 	localhost" >> /etc/hosts
echo "::1 	localhost" >> /etc/hosts
echo "127.0.1.1 	arch.localdomain 	arch" >> /etc/hosts

#Install
pacman -S xorg xorg-xinit i3 i3status i3blocks i3-gaps nitrogen picom dmenu firefox opera alacritty pulseaudio pulseaudio-alsa alsa alsa-utils alsamixer htop grub efibootmgr dosfstools os-prober mtools networkmanager base-devel linux-headers htop sudo xf86-video-intel intel-ucode terminator

#Grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#Network Manager
systemctl start NetworkManager
systemctl enable NetworkManager

#User
useradd -m kyretof
usermod -aG wheel,audio,video,optical,storage kyretof

#Font
pacman -S dina-font tamsyn-font ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji

#Firewall
sudo pacman -S ufw
sudo systemctl start ufw
sudo systemctl enable ufw

#Config

#xinitrc 
cp /etc/X11/xinit/xinitrc ~/.xinitrc

#yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
