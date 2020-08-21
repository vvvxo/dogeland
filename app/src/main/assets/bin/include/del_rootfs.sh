# dogeland cli module
#
# license: gpl-v3
del_rootfs() {
if [ -d "$rootfs/usr/" ];then
  echo "- Disabling"
  stop_rootfs
  umount_part
  echo "- Removing"
  rm -rf $rootfs/*
  echo "- Done"
  else
  echo "- error"
fi
}
