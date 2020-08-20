# dogeland cli module
#
# license: gpl-v3
mount_part(){
if [ -d "$rootfs/proc/1/" ];then
 echo "">/dev/null
  else
 echo "- /proc ..."
   mount -t proc proc $rootfs/proc
fi

if [ -d "$rootfs/sys/kernel/" ];then
 echo "">/dev/null
  else
 echo "- /sys ..."
  mount -t sysfs sysfs $rootfs/sys
fi

if [ -d "$rootfs/dev/block/" ];then
  echo "">/dev/null
  else
  echo "- /dev ..."
  mount -o bind /dev/ $rootfs/dev
fi

if [ -e "$rootfs/dev/pts/0" ];then
  echo "">/dev/null
  else
  echo "- /dev/pts ..."
  mount -t devpts devpts $rootfs/dev/pts
fi

if [ -d "/dev/net/tun" ];then
  # Mount Network
  if [ -d "$rootfs/dev/net/tun" ];then
  echo "">/dev/null
  else
  echo "- /dev ..."
  mount -o bind /dev/net/tun $rootfs/dev/net/tun
  fi
  #
  else
  echo "">/dev/null
fi

if [ ! -e "/dev/tty0" ]; then
  echo "">/dev/null
  else
  echo "- /dev/tty ... "
  ln -s /dev/null /dev/tty0
fi

if [ -e "$rootfs/mnt/host-rootfs" ];then
  echo "">/dev/null
  else
  echo "- /mnt/host-rootfs ..."
  ln -s /proc/1/cwd $rootfs/mnt/host-rootfs
fi
}