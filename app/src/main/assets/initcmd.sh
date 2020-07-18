#!/system/bin/sh
script_path="$1"
# Core
export EXECUTOR_PATH=$({EXECUTOR_PATH})
export START_DIR=$({START_DIR})
export PACKAGE_NAME=$({PACKAGE_NAME})
export SDCARD_PATH=$({SDCARD_PATH})
export TOOLKIT=$({TOOLKIT})
export DATA2_DIR="/$SDCARD_PATH/Android/data/$PACKAGE_NAME/"
export CONFIG_DIR="$DATA2_DIR/config/"
export TMPDIR=$START_DIR
# PATH
export platform=$(sh $TOOLKIT/cli.sh platform)
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$TOOLKIT/lib/$platform/"
export PATH="$PATH:$TOOLKIT"
export PREFIX=$START_DIR
# PRoot
export PROOT_TMP_DIR="$DATA2_DIR/cache/"
export PROOT_LOADER="$TOOLKIT/lib/$platform/lib_loader.so"
if [[ "$platform" != "x86_64" ]]
then
echo "">/dev/null
else
export PROOT_LOADER_32="$TOOLKIT/lib/$platform/lib_loader32.so"
fi
# Config
export confid="$(cat $CONFIG_DIR/.id.conf)"
export cmd=$(cat $CONFIG_DIR/$confid/cmd.conf)
export rootfs=$(cat $CONFIG_DIR/$confid/rootfs.conf)
export PATH2=$(cat $CONFIG_DIR/$confid/path.conf)
# Run Command
if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
  sh $TOOLKIT/install_bin.sh
fi

if [[ "$execute_path" != "" ]] && [[ -d "$execute_path" ]]
then
    cd "$execute_path"
fi

if [[ -f "$script_path" ]]; then
    chmod 755 "$script_path"
    sh "$script_path"
else
    echo "!运行 ${script_path} 出现致命错误" 1>&2
fi
# Clean
if [ -d "$START_DIR/kr-script/cache/" ];then
 mv $START_DIR/kr-script/cache/* $DATA2_DIR/cache/
fi
exit