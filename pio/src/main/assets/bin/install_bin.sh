#!/system/bin/sh
# Busybox 
function busybox_install() {
    for applet in `./busybox --list`; do
        case "$applet" in
        "sh"|"busybox"|"shell"|"swapon"|"swapoff"|"mkswap")
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
    export platform=$(sh $TOOLKIT/service.sh platform)
    rm $TOOLKIT/busybox
    mv $TOOLKIT/busybox_$platform $TOOLKIT/busybox
    busybox_install
    rm $TOOLKIT/busybox_$platform
    fi
fi
# Default Config Install
if [ -d "$CONFIG_DIR/default/" ];then
  echo "">/dev/null
  else
  mkdir $DATA2_DIR > $LOG_EXPORT
  mkdir $CONFIG_DIR > $LOG_EXPORT
  mkdir $CONFIG_DIR/default >$LOG_EXPORT
  echo "default" >$CONFIG_DIR/.id.conf
  echo "" > $CONFIG_DIR/default/rootfs.conf
  echo "" > $CONFIG_DIR/default/cmd.conf
fi

# PkgDetails
if [[ ! -f pkgdetails ]]; then
    ln -s $TOOLKIT/pkgdetails_arm $TOOLKIT/pkgdetails_arm_64
    ln -s $TOOLKIT/pkgdetails_x86 $TOOLKIT/pkgdetails_x86_64
    ln -s $TOOLKIT/pkgdetails_$platform $TOOLKIT/pkgdetails
fi