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
set_tempdir() {
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

set_rootfsdir() {
if [ ! -n "$Input" ]; then
echo "- 检测到没有输入内容,取消更改."
    else
    echo "- 正在修改Rootfs路径"
    rm -rf $CONFIG_DIR/rootfs.conf
    echo "$Input">$CONFIG_DIR/rootfs.conf
    echo "- 完成,已设置 $Input"
    fi
}

set_initcmd() {
if [ ! -n "$Input" ]; then
 echo "- 检测到没有输入内容,取消更改."
else
 echo "- 正在修改"
 rm -rf $CONFIG_DIR/cmd.conf
 echo "$Input">$CONFIG_DIR/cmd.conf
 echo "- 完成,已修改 $Input"
fi
}

set_runarch(){
echo "- 正在设置 $type ..."
sed "20c export platform=$type" $START_DIR/exec_start.sh
echo "- 正在应用更改.."
source $TOOLKIT/reinstall_bin.sh
rm -rf $TOOLKIT/reinstall_bin.sh
echo "- 完成"
}