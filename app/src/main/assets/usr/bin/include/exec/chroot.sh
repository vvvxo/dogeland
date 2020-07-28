#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_chroot(){
check_rootfs 
mount_part
set_env
echo "">/dev/null
echo "$cmd2">$rootfs/runcmd.sh
chmod 0777 $rootfs/runcmd.sh
echo "">/dev/null
if [ -f "$rootfs/bin/su" ];then
$TOOLKIT/chroot "$rootfs" /bin/su -c $userid /runcmd.sh
pkill su
else
if [ -f "$rootfs/bin/sh" ];then
$TOOLKIT/chroot "$rootfs" /bin/sh /runcmd.sh
pkill sh
else
if [ -f "$rootfs/bin/ash" ];then
$TOOLKIT/chroot "$rootfs" /bin/ash /runcmd.sh
pkill ash
else
if [ -f "$rootfs/bin/bash" ];then
$TOOLKIT/chroot "$rootfs" /bin/bash /runcmd.sh
pkill bash
else
echo "不支持的操作"
fi
echo "">/dev/null
fi
echo "">/dev/null
fi
echo "">/dev/null
fi
rm -rf $rootfs/runcmd.sh
}
