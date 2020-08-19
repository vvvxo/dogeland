#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
stop_rootfs(){
if [[ "$(cat $rootfs/dogeland/status)" != "Run" ]]
then
echo "">/dev/null
else

# Change Status
rm -rf $rootfs/dogeland/status
echo "Stop">$rootfs/dogeland/status
pkill sshd && pkill dropbear
pkill vncserver
pkill ash && pkill zsh && pkill bash
pkill sh && pkill chroot && pkill proot

fi
}