#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
mount_part(){
if [ -d "$rootfs/proc/1/" ];then
 echo "">/dev/null
  else
 echo "- /proc ..."
   mount -o bind /proc $rootfs/proc
fi
if [ -d "$rootfs/sys/kernel/" ];then
 echo "">/dev/null
  else
 echo "- /sys ..."
  mount -o bind /sys $rootfs/sys
fi
if [ -d "$rootfs/sdcard/" ];then
  echo "">/dev/null
  else
  echo "- /sdcard ..."
  mount -o bind $SDCARD_PATH $rootfs/mnt
fi
if [ -d "$rootfs/dev/block/" ];then
  echo "">/dev/null
  else
  echo "- /dev ..."
  mount -o bind /dev/ $rootfs/dev
fi
echo "- /dev/shm ..."
mount -o bind /dev/shm $rootfs/dev/shm
echo "- /dev/pts ..."
mount -o bind /dev/pts $rootfs/dev/pts

if [ ! -e "/dev/tty0" ]; then
  echo "">/dev/null
  else
  echo "- /dev/tty ... "
  ln -s /dev/null /dev/tty0
fi

}