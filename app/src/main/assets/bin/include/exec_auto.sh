# dogeland cli module
#
# license: gpl-v3
exec_auto(){
echo
check_rootfs 
if [ `id -u` -eq 0 ];then
   exec_chroot
   exit
else
   if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  exec_proot_termux
  exit
  else
  exec_proot
  exit
  fi
fi
}
