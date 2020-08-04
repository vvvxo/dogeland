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

set_runarch(){
echo "- 正在设置 $type ..."
sed "20c export platform=$type" $START_DIR/exec_start.sh
echo "- 正在应用更改.."
sleep 1
echo "#"
echo "# DogeLand Core Files ReInstaller"
echo "#"
echo "- 正在初始化(报错属于正常🐳现象)"
mkdir $PREFIX/lib
mkdir $PREFIX/etc
mkdir $PREFIX/tmp
mkdir $PREFIX/libexec
mkdir $START_DIR/home
mkdir $PREFIX/var
ln -s $TOOLKIT/lib/$platform/* $PREFIX/lib/
# DATA2_DIR
if [ -d "$DATA2_DIR" ];then
  mkdir $DATA2_DIR/
  else
  echo "">/dev/null
fi
# Busybox
if [[ ! "$TOOLKIT" = "" ]]; then
    cd "$TOOLKIT"
    if [[ ! -f arch ]]; then
    export platform=$(sh $TOOLKIT/cli.sh platform)
    rm -rf $TOOLKIT/busybox
    mv $TOOLKIT/busybox_$platform $TOOLKIT/busybox
    busybox_install
    fi
fi
# Default Config Install
if [ -d "$CONFIG_DIR/default/" ];then
  echo "">/dev/null
  else
  mkdir $DATA2_DIR > /dev/null
  if [ -d "$DATA2_DIR/" ];then
  echo "">/dev/null
  else
  echo "!数据初始化失败"
  echo "检测到没有得到存储权限或者是Android10"
  echo "因《Android绿色公约》要求,只能使用内部存储的私有目录(Android/data),因源码缺陷无法自动创建私有文件夹,导致无法使用proot与存储配置文件"
  echo "----------"
  echo "说白了就是您需要手动在(内部存储/Android/data/)文件夹中新建一个名称为 me.flytree.dogeland 的文件夹之后再打开本应用问题才能解决."
  sleep 1000
  sleep 9999
  fi
  mkdir $CONFIG_DIR > /dev/null
  echo "" > $CONFIG_DIR/rootfs.conf
  echo "" > $CONFIG_DIR/cmd.conf
  echo "" > $CONFIG_DIR/path.conf
fi
# Cache
if [ -d "$DATA2_DIR/cache/" ];then
  echo "">/dev/null
  else
  mkdir $DATA2_DIR/cache/
fi
# Proot
if [[ ! -f $TOOLKIT/proot ]]; then
ln -s $TOOLKIT/lib/$platform/lib_proot.so $TOOLKIT/proot
fi
# Other
if [[ ! -f $START_DIR/issue ]]; then
mv $TOOLKIT/issue $START_DIR/
fi
if [[ ! -f $START_DIR/LICENSE ]]; then
mv $TOOLKIT/LICENSE $START_DIR/
fi
# Kill
echo "- 初始化完成🍉"
echo "- 完成"
}
busybox_install(){
    for applet in `./busybox --list`; do
        case "$applet" in
        "swapon"|"swapoff"|"mkswap"|"wget")
            echo 'Skip' > /dev/null
        ;;
        *)
            ./busybox ln -sf busybox "$applet";
        ;;
        esac
    done
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