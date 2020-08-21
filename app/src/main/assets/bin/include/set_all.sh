# dogeland cli module
#
# license: gpl-v3
set_path(){
rm -rf $CONFIG_DIR/path.conf
echo "$Input">$CONFIG_DIR/path.conf
}
set_tempdir(){
    if [ ! -n "$Input" ]; then
    echo "- Cancel."
    else
    echo "- Setting up"
    sleep 1
    rm -rf $CONFIG_DIR/tmpdir.conf
    echo "$Input">$CONFIG_DIR/tmpdir.conf
    echo "- done"
    sleep 1
    exit
fi
}
set_rootfsdir(){
if [ ! -n "$Input" ]; then
echo "- cancel."
    else
    echo "- Setting up"
    rm -rf $CONFIG_DIR/rootfs.conf
    echo "$Input">$CONFIG_DIR/rootfs.conf
    echo "- done"
    fi
}
set_initcmd(){
if [ ! -n "$Input" ]; then
 echo "- cancel."
else
 echo "- Setting up"
 rm -rf $CONFIG_DIR/cmd.conf
 echo "$Input">$CONFIG_DIR/cmd.conf
 echo "- done"
fi
}
set_emulator_qemu(){
if [[ "$qemu" != "0" ]]
then
rm -rf $CONFIG_DIR/emulator_qemu
echo "$qemu">$CONFIG_DIR/emulator_qemu
else
rm -rf $CONFIG_DIR/emulator_qemu
fi
}