# dogeland cli module
#
# license: gpl-v3
exec_proot_termux(){
check_rootfs 
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  echo ""
  else
  echo "- 不支持的操作"
  exit 255
fi
set_env
echo
echo "- Running"
# Enable FakeKernel
if [ -f "$CONFIG_DIR/fake_kernel" ];then
export fake=$(cat $CONFIG_DIR/fake_kernel)
export addcmd="$addcmd -k $fake"
else
echo "">/dev/null
fi 
# Enable QEMU Emulator
if [ -f "$CONFIG_DIR/emulator_qemu" ];then
export qemu="$TOOLKIT/qemu-$(cat $CONFIG_DIR/emulator_qemu)"
export addcmd="$addcmd -q $qemu"
else
echo "">/dev/null
fi 
/data/data/com.termux/files/usr/bin/proot $addcmd --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -b /proc/self/fd:/dev/fd -w /root $cmd2
echo
}