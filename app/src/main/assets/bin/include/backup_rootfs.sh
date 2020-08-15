#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
backup_rootfs(){
echo "- 正在关闭容器"
stop_rootfs
umount_part
echo "- 正在导出系统"
cd $rootfs/
if [ ! -n "$dir" ]; then
  tar czvf "$DATA2_DIR/backup.tgz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./dogeland' -C "$rootfs/" . >/dev/null
  echo "  已保存: $DATA2_DIR/backup.tgz"
else
  tar czvf "$dir/backup.tgz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./dogeland' -C "$rootfs/" . >/dev/null
  echo "  已保存: $dir/backup.tgz"
fi
echo "- 完成"

}