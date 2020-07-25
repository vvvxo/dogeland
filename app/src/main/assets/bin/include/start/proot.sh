#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_proot(){
export fake=$(cat $TOOLKIT/fake_kernel)
check_rootfs 
set_env
$TOOLKIT/proot $addcmd -0 -k $fake --link2symlink -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd 
echo "- Done"
sleep 1
}