#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_chroot(){
check_rootfs 
mount_part
set_env
echo "- Pushing"
echo "$cmd2">$rootfs/runcmd.sh
chmod 0777 $rootfs/runcmd.sh
echo
echo
echo "- Running"
echo
echo
if [ -f "$rootfs/bin/su" ];then
$TOOLKIT/chroot "$rootfs" /bin/su -c $userid /runcmd.sh
else
if [ -f "$rootfs/bin/sh" ];then
$TOOLKIT/chroot "$rootfs" /bin/sh /runcmd.sh
else
if [ -f "$rootfs/bin/ash" ];then
$TOOLKIT/chroot "$rootfs" /bin/ash /runcmd.sh
else
if [ -f "$rootfs/bin/bash" ];then
$TOOLKIT/chroot "$rootfs" /bin/bash /runcmd.sh
else
echo "不支持的操作"
fi
echo
fi
echo
fi
echo
fi

echo "- Cleaning"
rm -rf $rootfs/runcmd.sh
echo "- Done"
}
