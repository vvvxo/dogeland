#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_proot(){
export fake=$(cat $TOOLKIT/fake_kernel)
check_rootfs 
set_env
echo
echo "- Running"
echo ""
$TOOLKIT/proot -k $fake --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd2
echo
}
