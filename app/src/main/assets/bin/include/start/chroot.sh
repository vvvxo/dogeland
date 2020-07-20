#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_chroot(){
check_rootfs 
mount_part
set_env
$TOOLKIT/busybox chroot $addcmd $rootfs $cmd
echo "- All Done"
sleep 1
}
