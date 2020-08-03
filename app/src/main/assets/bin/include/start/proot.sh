#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_proot(){
check_rootfs
# Check RunStatus
if [[ "$(cat $rootfs/status)" != "Stop" ]]
then
# if Run,Then Stop
stop_rootfs
else
# Start

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
set_env
# Change Status and Start
echo "Run">$rootfs/status
$TOOLKIT/proot $addcmd -0 --link2symlink -r $rootfs -b /dev -b /sys -b /proc/ -b /proc/self/fd:/dev/fd -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd 
echo "- Done"
sleep 1


fi

}