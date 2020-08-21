# dogeland cli module
#
# license: gpl-v3
proot_fake_kernel(){
if [[ "$(cat $rootfs/dogeland/status)" != "" ]]
then
rm -rf $TOOLKIT/fake_kernel
echo "$kernel" > $TOOLKIT/fake_kernel
else
rm -rf $TOOLKIT/fake_kernel
fi
}
edit_passwd(){
export cmd2=chpasswd
echo "$username:$password"|exec_auto
unset cmd2
}
plugin_installer(){
echo "- Unpacking"
unzip $file -d $START_DIR/
echo "- Installing"
. $START_DIR/install.sh
rm $START_DIR/install.sh
echo "- Done"
}