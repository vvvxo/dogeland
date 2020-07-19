#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_proot(){
check_rootfs 
set_env
$TOOLKIT/proot $addcmd -0 --link2symlink -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd 
echo "- Done"
sleep 1
}