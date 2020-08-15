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
if [[ "$(pwd)" != "/" ]]
then
tar czvf "$dir/backup.tgz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./dogeland' -C "$rootfs/" . >/dev/null
echo "已保存到 $dir/backup.tgz"
else
echo "!出现异常"
exit 1
fi
echo "- 完成"

}