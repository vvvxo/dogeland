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

echo "- Initializing (errors are normal 🐳 phenomenon)"

if [[ "$platform" != "unknown" ]]
then
echo "">/dev/null
else
echo "- $platform is detected, uname does not exist or your device is not supported"
exit 5
fi

busybox_$platform chmod -R 0777 $TOOLKIT/
# lib
if [ -d "$PREFIX/lib/" ];then
  echo "">/dev/null
  else
  busybox_$platform mkdir $PREFIX/lib
  busybox_$platform mv $TOOLKIT/libs/$platform/* $PREFIX/lib/
  busybox_$platform rm -rf $TOOLKIT/libs/
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
    rm -rf $TOOLKIT/busybox_*
    fi
fi
# Proot
if [[ ! -f $TOOLKIT/proot ]]; then
ln -s $PREFIX/lib/lib_proot.so $TOOLKIT/proot
fi

# DATA2_DIR
if [ -d "$DATA2_DIR" ];then
  echo "">/dev/null
  else
  mkdir -p $DATA2_DIR
  if [ -d "$DATA2_DIR" ];then
  echo "">/dev/null
  else
  echo "!Data initialization failed"
  echo "Detected that no storage permissions or Android10+"
  echo "----------"
  echo "To put it bluntly, you need to manually create a new folder named me.flytree.dogeland in the (internal storage/Android/data/) folder and then open this application to solve the problem.."
  exit 2
  sleep 1000
  fi
fi

# Default Config Install
if [ -d "$CONFIG_DIR/" ];then
  echo "">/dev/null
  else
  mkdir $CONFIG_DIR
  echo "" >$CONFIG_DIR/rootfs.conf
  echo "" >$CONFIG_DIR/cmd.conf
  echo "" >$CONFIG_DIR/path.conf
fi

# Kill
echo "- done🍉"
echo "" >$TOOLKIT/install_bin_done
mv $TOOLKIT/install_bin.sh $TMPDIR/install_bin.shbak
echo && echo && echo && echo
sleep 1
fi