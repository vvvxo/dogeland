#
# DogeLand Core Files Installer
#
quit(){
echo "">/dev/null
exit
}
if [ -f "$TOOLKIT/install_bin_done" ];then
quit
else
echo "- 正在初始化(报错属于正常🐳现象)"
busybox_$platform mkdir $PREFIX/lib
busybox_$platform ln -s $TOOLKIT/libs/$platform/* $PREFIX/lib/
# DATA2_DIR
if [ -d "$DATA2_DIR" ];then
  busybox_$platform mkdir $DATA2_DIR/
  else
  echo "">/dev/null
fi
# Busybox
function busybox_install() {
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
if [[ ! "$TOOLKIT" = "" ]]; then
    cd "$TOOLKIT"
    if [[ ! -f arch ]]; then
    export platform=$(sh $TOOLKIT/cli.sh platform)
    busybox_$platform rm -rf $TOOLKIT/busybox
    busybox_$platform mv $TOOLKIT/busybox_$platform $TOOLKIT/busybox
    busybox_install
    fi
fi
# Default Config Install
if [ -d "$CONFIG_DIR/" ];then
  echo "">/dev/null
  else
  mkdir $DATA2_DIR > /dev/null
  if [ -d "$DATA2_DIR/" ];then
  echo "">/dev/null
  else
  echo "!数据初始化失败"
  echo "检测到没有得到 存储权限 或者是 Android10+"
  echo "----------"
  echo "说白了就是需要手动在(内部存储/Android/data/)文件夹中新建一个名称为 me.flytree.dogeland 的文件夹之后再打开本应用问题才能解决."
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
ln -s $TOOLKIT/libs/$platform/lib_proot.so $TOOLKIT/proot
fi
# Bash
if [[ "$platform" != "arm" ]] && [[ "$platform" != "arm64" ]]
then
if [[ "$platform" != "x86" ]] && [[ "$platform" != "x86_64" ]]
then
echo "">/dev/null
else
ln -s $TOOLKIT/bash_x86 $TOOLKIT/bash
fi
else
ln -s $TOOLKIT/bash_arm $TOOLKIT/bash
fi
# Other
if [[ ! -f $START_DIR/LICENSE ]]; then
mv $TOOLKIT/LICENSE $START_DIR/
fi
# Kill
echo "- 初始化完成🍉"
echo "" >$TOOLKIT/install_bin_done
rm -rf $TOOLKIT/install_bin.sh && rm -rf $TOOLKIT/install_bin.sh
echo ""
echo ""
echo ""
fi