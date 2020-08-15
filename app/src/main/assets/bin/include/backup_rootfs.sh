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
if [[ "$(pwd)" != "$rootfs" ]] && if [[ "$(pwd)" != "$rootfs/" ]]
then
echo "!无法切换到Rootfs目录,备份失败."
exit 1
else
tar czvf "$DATA2_DIR/backup.tgz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./dogeland' -C "$rootfs/" . >/dev/null
fi
echo "- 完成"

}