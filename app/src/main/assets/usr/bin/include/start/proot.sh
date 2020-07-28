#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_proot(){
# Check RunStatus
if [[ "$(cat $rootfs/status)" != "Stop" ]]
then
# if Run,Then Stop
stop_rootfs
else
# Start
if [ -f "$TOOLKIT/fake_kernel" ];then
export fake=$(cat $TOOLKIT/fake_kernel)
export addcmd="$addcmd -k $fake"
else
echo "">/dev/null
fi
check_rootfs 
set_env
# Change Status and Start
echo "Run">$rootfs/status
$TOOLKIT/proot $addcmd -0 --link2symlink -r $rootfs -b /dev -b /sys -b /proc/ -b /proc/self/fd:/dev/fd -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd 
echo "- Done"
sleep 1


fi

}