# dogeland cli module
#
# license: gpl-v3
backup_rootfs(){
echo "- Disabling"
stop_rootfs
umount_part
echo "- Backuping"
cd $rootfs/
if [[ "$(pwd)" != "/" ]]
then
tar czvf "$dir/backup.tgz" --exclude='./dev' --exclude='./sys' --exclude='./proc' --exclude='./mnt'  --exclude='./sdcard'  --exclude='./dogeland' ./ >/dev/null
echo "Saved to $dir/backup.tgz"
else
echo "!Error"
exit 1
fi
echo "- Done"

}