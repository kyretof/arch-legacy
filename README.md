# Arch Linux DOS/BIOS Installation Guide

### Verify the boot mode
`# ls /sys/firmware/efi/efivars`

---

### Connect to the internet
```
iwctl
device list
station device scan
station device get-networks
station device connect SSID
```

---

### Update the system clock
`# timedatectl set-ntp true`

---

### Partition the disks
```
# cfdisk
2G | Linux Swap
50G | Linux
```

---

### Format Partitions
```
# mkfs.ext4 /dev/sda2
# mkswap /dev/sda1
```
---

### Mount the file systems
```
# mount /dev/sda2 /mnt
# swapon /dev/sda1
```
---

### Synchronize package databases
`# pacman -Syy`

---

### Fastest mirror
```
# pacman -S reflector
# reflector --verbose --latest 20 --sort rate  --save /etc/pacman.d/mirrorlist 
```

---

### Keyring update
`pacman -S archlinux-keyring`

---

### Install essential packages
`# pacstrap /mnt base linux-lts linux-firmware vim nano git`

---

### Fstab
`# genfstab -U /mnt >> /mnt/etc/fstab`

---

### Chroot
`# arch-chroot /mnt`

---

### Set the time zone
`# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime`

---

### Run hwclock(8) to generate /etc/adjtime
`# hwclock --systohc`

---

### Localization
```
Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running: 

# locale-gen

Create the locale.conf(5) file, and set the LANG variable accordingly: 

# echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```

---

### Network configuration
```
Create the hostname file: 

# echo 'hostname' >> /etc/hostname

Add the hosts ip

# vim /etc/hosts

127.0.0.1        localhost
::1              localhost
127.0.1.1        myhostname

```

---

### Add user

```
Users and passwords:
passwd (set root pass)
useradd -m username (make another user)
passwd username (set that user's password)
usermod -aG wheel,audio,video,optical,storage username


Sudo:
pacman -S sudo
EDITOR=nano visudo
---

### Install
`pacman -S xorg xorg-xinit i3 i3status i3blocks nitrogen picom dmenu firefox opera alacritty terminator alsa alsa-utils htop grub dosfstools os-prober mtools networkmanager base-devel linux-headers htop xf86-video-intel intel-ucode
`

---

### Network Manager
`systemctl enable NetworkManager`

---

### Grub
```
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

---

### Firewall
```
sudo pacman -S ufw
sudo systemctl start ufw
sudo systemctl enable ufw
```

---

### xinitrc 

cp /etc/X11/xinit/xinitrc ~/.xinitrc

nitrogen --restore &

picom & 

exec i3


---

### i3 config

exec_always xrandr --output LVDS1 --off

#hide edge borders both

for_window [class="^.*"] border pixel 2

#gaps

gaps inner 15
gaps outer 15

---

### Font
```
pacman -S dina-font tamsyn-font ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji
```

---

### yay
```
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
```
