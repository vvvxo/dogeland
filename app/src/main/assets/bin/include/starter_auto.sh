#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
start_auto(){
if [ `id -u` -eq 0 ];then
   start_chroot
   exit
else
   echo "">/dev/null
fi
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  start_proot_termux
  exit
  else
  start_proot
  exit
fi
}
