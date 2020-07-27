#
# DogeLand Core Files Installer
#
quit(){
echo "">/dev/null
exit
}
if [ -f "$START_DIR/install_bin_done" ];then
quit
else
echo "- 正在初始化(报错属于正常🐳现象)"
mkdir $START_DIR/lib
mkdir $START_DIR/etc
ln -s $TOOLKIT/lib/$platform/* $START_DIR/lib/
# DATA2_DIR
if [ -d "$DATA2_DIR" ];then
  mkdir $DATA2_DIR/
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
# Dropbear
if [[ ! -f $TOOLKIT/dropbearmulti ]]; then
ln -s $TOOLKIT/dropbearmulti_$platform $TOOLKIT/dropbear
ln -s $TOOLKIT/dropbearmulti_$platform $TOOLKIT/dropbearkey
ln -s $TOOLKIT/dropbearmulti_$platform $TOOLKIT/dropbearconvert
ln -s $TOOLKIT/dropbearmulti_$platform $TOOLKIT/dbclient
ln -s $TOOLKIT/dropbearmulti_$platform $TOOLKIT/ssh
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
echo "" >$START_DIR/install_bin_done
rm -rf $TOOLKIT/install_bin.sh && rm -rf $TOOLKIT/install_bin.sh
sleep 2
echo ""
echo ""
echo ""
echo ""
fi