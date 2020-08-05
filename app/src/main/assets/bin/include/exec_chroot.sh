#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
exec_chroot(){

check_rootfs

# Ready Enable QEMU Emulator
if [ -f "$CONFIG_DIR/emulator_qemu" ];then
export qemu="$(cat $CONFIG_DIR/emulator_qemu)"
export qemu_enable=1
else
echo "">/dev/null
fi 

mount_part
if [[ "$qemu_enable" != "1" ]]
then
export chroot="$TOOLKIT/busybox chroot $addcmd "
else
export chroot="$TOOLKIT/qemu-$qemu $TOOLKIT/busybox_$qemu chroot $addcmd "
fi
set_env
echo "">/dev/null
echo "$cmd2">$rootfs/dogeland/runcmd.sh
chmod 755 $rootfs/dogeland/runcmd.sh
echo "">/dev/null
if [ -f "$rootfs/bin/su" ];then
$chroot "$rootfs" /bin/su -c /dogeland/runcmd.sh
else
if [ -f "$rootfs/bin/sh" ];then
$chroot "$rootfs" /bin/sh /dogeland/runcmd.sh
pkill sh
else
if [ -f "$rootfs/bin/ash" ];then
$chroot "$rootfs" /bin/ash /dogeland/runcmd.sh
pkill ash
else
if [ -f "$rootfs/bin/bash" ];then
$chroot "$rootfs" /bin/bash /dogeland/runcmd.sh
pkill bash
else
if [ -f "$rootfs/bin/zsh" ];then
$chroot "$rootfs" /bin/zsh /dogeland/runcmd.sh
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
echo "">/dev/null
fi
rm -rf $rootfs/dogeland/runcmd.sh
}
