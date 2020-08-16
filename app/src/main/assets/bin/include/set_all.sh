#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
set_path(){
echo "- 正在设置PATH..."
rm -rf $CONFIG_DIR/path.conf
echo "$Input">$CONFIG_DIR/path.conf
echo "- 完成"
}
set_tempdir(){
    if [ ! -n "$Input" ]; then
    echo "- 检测到没有输入内容,取消更改."
    else
    echo "- 正在更改"
    sleep 1
    rm -rf $CONFIG_DIR/tmpdir.conf
    echo "$Input">$CONFIG_DIR/tmpdir.conf
    echo "- 完成"
    sleep 1
    exit
fi
}
set_rootfsdir(){
if [ ! -n "$Input" ]; then
echo "- 检测到没有输入内容,取消更改."
    else
    echo "- 正在修改Rootfs路径"
    rm -rf $CONFIG_DIR/rootfs.conf
    echo "$Input">$CONFIG_DIR/rootfs.conf
    echo "- 完成,已设置 $Input"
    fi
}
set_initcmd(){
if [ ! -n "$Input" ]; then
 echo "- 检测到没有输入内容,取消更改."
else
 echo "- 正在修改"
 rm -rf $CONFIG_DIR/cmd.conf
 echo "$Input">$CONFIG_DIR/cmd.conf
 echo "- 完成,已修改 $Input"
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