#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
backup_rootfs(){
echo "正在关闭容器"
stop_rootfs
umount_part
echo "- 正在导出系统"
cd $rootfs/
tar czvf "$DATA2_DIR/backup.tgz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./support' -C "$rootfs/" . >/dev/null
echo "- 完成"
echo "  已保存到$DATA2_DIR/中"
}