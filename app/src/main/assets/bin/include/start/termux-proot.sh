#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_proot_termux(){
# Check RunStatus
if [[ "$(cat $rootfs/status)" != "Stop" ]]
then
# if Run,Then Stop
stop_rootfs
else
# Start

check_rootfs 
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  echo ""
  else
  echo "- 不支持的操作"
  exit 255
  sleep 1000
fi
set_env
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
# Change Status and Start.
echo "Run">$rootfs/status
/data/data/com.termux/files/usr/bin/proot $addcmd --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b /proc/self/fd:/dev/fd -b $rootfs/root:/dev/shm  -w /root $cmd 
echo "- Done"
sleep 1

fi
}