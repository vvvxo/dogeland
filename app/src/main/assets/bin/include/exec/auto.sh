#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_auto(){
echo
check_rootfs 
if [ `id -u` -eq 0 ];then
   exec_chroot
   exit
else
   echo "">/dev/null
fi
if [ -f "/data/data/com.termux/files/usr/bin/" ];then
  exec_proot_termux
  exit
  else
  exec_proot
  exit
fi
sleep 1
}
