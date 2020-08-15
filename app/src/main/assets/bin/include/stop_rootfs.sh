#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
stop_rootfs(){
chroot="pgrep -f chroot"
proot="pgrep -f proot"
# Stop Service
pkill $sshd
pkill busybox
pkill vncserver
pkill dropbear
# Stop Shell
pkill ash
pkill zsh
pkill bash
pkill ash
# Killed
kill $chroot >/dev/null
kill $proot >/dev/null
# Change Status
rm -rf $rootfs/dogeland/status
echo "Stop">$rootfs/dogeland/status
pkill me.flytree.dogeland >/dev/null
}