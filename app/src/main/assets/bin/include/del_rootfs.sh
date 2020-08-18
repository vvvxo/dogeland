# dogeland cli module
#
# license: gpl-v3
del_rootfs() {
if [ -d "$rootfs/usr/" ];then
  echo "- 正在关闭"
  stop_rootfs
  umount_part
  echo "- 正在删除"
  rm -rf $rootfs/*
  echo "- 删除完成"
  else
  echo "- 找不到Rootfs路径"
fi
}
