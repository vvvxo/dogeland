#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
stop_rootfs(){
pkill sshd && pkill dropbear
pkill vncserver
pkill ash && pkill zsh && pkill bash
pkill sh && pkill chroot && pkill proot
# Change Status
rm -rf $rootfs/dogeland/status
echo "Stop">$rootfs/dogeland/status
}