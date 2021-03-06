# dogeland cli module
#
# license: gpl-v3
start_chroot(){
# Check RunStatus
if [[ "$(cat $rootfs/dogeland/status)" != "Stop" ]]
then
# if Run,Then Stop
stop_rootfs
else
# Start

# Enable QEMU Emulator
if [ -f "$CONFIG_DIR/emulator_qemu" ];then
export qemu="$(cat $CONFIG_DIR/emulator_qemu)"
export qemu_enable=1
else
echo "">/dev/null
fi 
if [[ "$qemu_enable" != "1" ]]
then
export chroot="$TOOLKIT/busybox chroot $addcmd "
else
export chroot="$TOOLKIT/qemu-$qemu $TOOLKIT/busybox_$qemu chroot $addcmd "
fi

check_rootfs 
mount_part
set_env
# Change Status and Start
echo "Run">$rootfs/dogeland/status
$chroot $addcmd $rootfs $cmd
echo "- All Done"
fi
}
