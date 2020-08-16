#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
stop_rootfs(){
# Stop Service
pkill sshd
pkill busybox
pkill vncserver
pkill dropbear
# Stop Shell
pkill ash
pkill zsh
pkill bash
pkill ash
# Killed
kill chroot
kill proot
# Change Status
rm -rf $rootfs/dogeland/status
echo "Stop">$rootfs/dogeland/status
pkill me.flytree.dogeland >/dev/null
}