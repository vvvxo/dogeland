#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_chroot(){
# Check RunStatus
if [[ "$(cat $rootfs/status)" != "Stop" ]]
then
# if Run,Then Stop
stop_rootfs
else
# Start
check_rootfs 
mount_part
set_env
# Change Status and Start
echo "Run">$rootfs/status
$TOOLKIT/busybox chroot $addcmd $rootfs $cmd
echo "- All Done"
sleep 1

fi
}
