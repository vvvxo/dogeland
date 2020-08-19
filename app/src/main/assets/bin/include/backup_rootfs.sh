# dogeland cli module
#
# license: gpl-v3
backup_rootfs(){
echo "- 正在关闭容器"
stop_rootfs
umount_part
echo "- 正在导出系统"
cd $rootfs/
if [[ "$(pwd)" != "/" ]]
then
tar cJvf "$dir/backup.tar.xz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./dogeland' ./ >/dev/null
echo "已保存到 $dir/backup.tar.xz"
else
echo "!出现异常"
exit 1
fi
echo "- 完成"

}