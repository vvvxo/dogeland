#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_proot(){
check_rootfs 
set_env
echo
echo "- Running"
echo ""
$TOOLKIT/proot --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd2
echo
}
