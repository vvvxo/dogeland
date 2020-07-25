#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_proot_termux(){
check_rootfs 
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  echo ""
  else
  echo "- 不支持的操作"
  exit 255
fi
set_env
export fake=$(cat $TOOLKIT/fake_kernel)
/data/data/com.termux/files/usr/bin/proot $addcmd -k $fake --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd 
echo "- Done"
sleep 1
}