#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
set_path(){
echo "- 正在设置PATH..."
rm -rf $CONFIG_DIR/$confid/path.conf
echo "$Input">$CONFIG_DIR/$confid/path.conf
echo "- 完成"
}
set_tempdir() {
    if [ ! -n "$Input" ]; then
    echo "- 检测到没有输入内容,取消更改."
    else
    echo "- 正在更改"
    sleep 1
    rm -rf $CONFIG_DIR/$confid/tmpdir.conf
    echo "$Input">$CONFIG_DIR/$confid/tmpdir.conf
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
    rm -rf $CONFIG_DIR/$confid/rootfs.conf
    echo "$Input">$CONFIG_DIR/$confid/rootfs.conf
    echo "- 完成,已设置 $Input"
    fi
}

set_initcmd() {
if [ ! -n "$Input" ]; then
 echo "- 检测到没有输入内容,取消更改."
else
 echo "- 正在修改"
 rm -rf $CONFIG_DIR/$confid/cmd.conf
 echo "$Input">$CONFIG_DIR/$confid/cmd.conf
 echo "- 完成,已修改 $Input"
fi
}

mk_conf() {
if [ -d "$CONFIG_DIR/" ];then
  echo
  else
  mkdir $CONFIG_DIR
fi
echo "- 正在创建配置 $mkconf"
mkdir $CONFIG_DIR/$mkconf/
echo "">$CONFIG_DIR/$mkconf/rootfs.conf
echo "">$CONFIG_DIR/$mkconf/cmd.conf
echo "">$CONFIG_DIR/$mkconf/path.conf
echo "- 正在切换配置 $mkconf"
rm $CONFIG_DIR/.id.conf
echo "$mkconf">$CONFIG_DIR/.id.conf
echo "- 完成,已创建 $mkconf"
exit
}

del_conf() {
if [ ! -n "$delconf" ]; then
  echo "- 检测到没有输入内容,取消更改."
else
  echo "- 正在删除配置 $delconf"
  sleep 1
  rm -rf $CONFIG_DIR/$delconf
  echo "- 完成,已删除 $delconf"
  sleep 1
  exit
fi
}

sw_conf() {
if [ ! -n "$swconf" ]; then
  echo "- 检测到没有输入内容,取消更改."
else
  echo "- 正在切换配置 $swconf"
  sleep 1
  rm -rf $CONFIG_DIR/.id.conf
  echo "$swconf">$CONFIG_DIR/.id.conf
  echo "- 完成,已切换 $swconf"
  sleep 1
  exit
fi
}