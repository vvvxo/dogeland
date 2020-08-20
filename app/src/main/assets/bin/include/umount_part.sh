# dogeland cli module
#
# license: gpl-v3
umount_part(){
echo "- Unmounting..."
# Check NoRoot
if [ `id -u` -eq 0 ];then
umount $rootfs/proc
umount $rootfs/sys
umount $rootfs/dev/pts
umount $rootfs/dev/shm
umount $rootfs/dev
rm $rootfs/mnt/host-rootfs
else
 echo "">/dev/null
fi
echo "- Done"
}