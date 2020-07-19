#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
stop_rootfs(){
pkill sshd
pkill proot
pkill busybox
pkill vncserver
pkill xfce4
pkill dropbear
pkill zsh
pkill bash
pkill sh
pkill chroot
pkill proot
}