#! /bin/sh

update_pacman_mirror(){
    ## Norway
    echo "Server = http://mirror.neuf.no/archlinux/\$repo/os/\$arch" | cat - /etc/pacman.d/mirrorlist > temp && mv temp /etc/pacman.d/mirrorlist
}

timedatectl set-ntp true

update_pacman_mirror
#packstrap
pacstrap /mnt base base-devel linux linux-firmware vim
##GenfsTab
genfstab -U /mnt >> /mnt/etc/fstab
cp part2 /mnt/root/part2
cp configUser /mnt/root/configUser
cp ../pkglist.txt /mnt/root/pkglist.txt

arch-chroot /mnt
