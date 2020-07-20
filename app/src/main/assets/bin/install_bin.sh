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
        "swapon"|"swapoff"|"mkswap")
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
  mkdir $CONFIG_DIR > /dev/null
  mkdir $CONFIG_DIR/default >/dev/null
  echo "default" >$CONFIG_DIR/.id.conf
  echo "" > $CONFIG_DIR/default/rootfs.conf
  echo "" > $CONFIG_DIR/default/cmd.conf
  echo "" > $CONFIG_DIR/default/path.conf
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
# ShellInabox
if [[ ! -f $TOOLKIT/shellinaboxd ]]; then
ln -s $TOOLKIT/shellinaboxd_arm $TOOLKIT/shellinaboxd_arm_64
ln -s $TOOLKIT/shellinaboxd_$platform  $TOOLKIT/shellinaboxd
fi
# Other
if [[ ! -f $START_DIR/issue ]]; then
mv $TOOLKIT/issue $START_DIR/
fi
if [[ ! -f $START_DIR/LICENSE ]]; then
mv $TOOLKIT/LICENSE $START_DIR/
fi
ln -s /system/bin/sh $TOOLKIT/sh
# Kill
echo "- 初始化完成🍉"
echo "" >$START_DIR/install_bin_done
rm -rf $TOOLKIT/install_bin.sh && rm -rf $TOOLKIT/install_bin.sh
fi