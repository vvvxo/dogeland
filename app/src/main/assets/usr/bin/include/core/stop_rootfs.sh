#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
stop_rootfs(){
# Change Status
rm -rf $rootfs/status
echo "Stop">$rootfs/status
# Stop Service
pkill sshd
pkill busybox
pkill vncserver
pkill xfce4
pkill dropbear
# Stop Shell
pkill ash
pkill zsh
pkill bash
pkill ash
# Killed
pkill chroot
pkill proot
}