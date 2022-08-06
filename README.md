# Arch Linux installation

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
````

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

### Install essential packages
`# pacstrap /mnt base linux linux-lts linux-firmware vim nano git`

---

### Fstab
`# genfstab -U /mnt >> /mnt/etc/fstab`

---

### Chroot
`# arch-chroot /mnt`

---

### base.sh
```
chmod +x base.sh
passwd (root)
passwd kyretof (additional user)

EDITOR=nano visudo
wheelall
```


### xinitrc 
```
nitrogen --restore &
picom & 
exec i3
```

---

### i3
```
exec_always xrandr --output LVDS1 --off

#hide edge borders both
for_window [class="^.*"] border pixel 2

#gaps
gaps inner 15
gaps outer 15

