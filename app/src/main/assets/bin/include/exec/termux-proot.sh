#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_proot_termux(){
export fake=$(cat $TOOLKIT/fake_kernel)
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
echo ""
if [ -f "$TOOLKIT/fake_kernel" ];then
export fake=$(cat $TOOLKIT/fake_kernel)
export addcmd="$addcmd -k $fake"
else
echo "">/dev/null
fi
/data/data/com.termux/files/usr/bin/proot $addcmd --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd2
echo
}