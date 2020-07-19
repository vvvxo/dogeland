#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_proot_termux(){
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
/data/data/com.termux/files/usr/bin/proot --link2symlink -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd2
echo
}