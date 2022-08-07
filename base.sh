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

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts


#User
useradd -m kyretof
usermod -aG wheel,audio,video,optical,storage kyretof
