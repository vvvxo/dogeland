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
if [ -f "$TOOLKIT/fake_kernel" ];then
export fake=$(cat $TOOLKIT/fake_kernel)
export addcmd="$addcmd -k $fake"
else
echo "">/dev/null
fi
$TOOLKIT/proot $addcmd --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd2
echo
}
