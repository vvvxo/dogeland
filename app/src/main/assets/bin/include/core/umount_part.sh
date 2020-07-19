#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
umount_part(){
echo "- Unmounting..."
umount $rootfs/proc
umount $rootfs/sys
umount $rootfs/dev/pts
umount $rootfs/dev/shm
umount $rootfs/dev
umount $rootfs/mnt
echo "- Done"
}