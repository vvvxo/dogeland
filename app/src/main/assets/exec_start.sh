#
# DogeLand-AppShell-Init
#
run="$1"
#
# BasicEnv
#
export EXECUTOR_PATH=$({EXECUTOR_PATH})
export TOOLKIT=$({TOOLKIT})
export START_DIR=$({START_DIR})
export TMPDIR=$START_DIR/kr-script/cache/
export SDCARD_PATH=$({SDCARD_PATH})
export PACKAGE_NAME=$({PACKAGE_NAME})
#
# DATA
#
export DATA2_DIR="$SDCARD_PATH/Android/data/$PACKAGE_NAME/"
export CONFIG_DIR="$DATA2_DIR/config/"
export platform=$(sh $TOOLKIT/cli.sh platform)
#
# RunEnv
#
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$START_DIR/lib/"
export PATH="$PATH:$TOOLKIT:$START_DIR/lib"
export PREFIX=$START_DIR
#
# PRoot
#

export PROOT_TMP_DIR="$TMPDIR"
export PROOT_LOADER="$TOOLKIT/lib/$platform/lib_loader.so"
# x64 ?
if [[ "$platform" != "x86_64" ]] && [[ "$platform" != "arm_64" ]]
then
echo "">/dev/null
else
export PROOT_LOADER_32="$TOOLKIT/lib/$platform/lib_loader32.so"
fi
#
# LoadConfig
#
export cmd=$(cat $CONFIG_DIR/cmd.conf)
export rootfs=$(cat $CONFIG_DIR/rootfs.conf)
export PATH2=$(cat $CONFIG_DIR/path.conf)
#
# Other or RunCmd
#
if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
  sh $TOOLKIT/install_bin.sh
fi
if [[ -f "$run" ]]; then
    chmod 755 "$run"
    sh "$run"
else
    echo "!运行命令时出现异常"
fi
if [[ -f "$START_DIR/kr-script/cache/" ]]; then
  echo "">/dev/null
  else
  mv $START_DIR/kr-script/cache/* $DATA2_DIR/cache/
fi