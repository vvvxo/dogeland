proot_fake_kernel(){
if [[ "$(cat $rootfs/status)" != "" ]]
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