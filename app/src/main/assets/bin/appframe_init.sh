#
# Core
#
export TOOLKIT=$({TOOLKIT})
export EXECUTOR_PATH=$({EXECUTOR_PATH})
export START_DIR=$({START_DIR})
export PACKAGE_NAME=$({PACKAGE_NAME})
export SDCARD_PATH=$({SDCARD_PATH})
#
# DATA
#
export DATA2_DIR="$SDCARD_PATH/Android/data/$PACKAGE_NAME/"
export CONFIG_DIR="$DATA2_DIR/config/"
export platform=$(sh $TOOLKIT/cli.sh platform)
#
# RunEnv
#
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$TOOLKIT/lib/$platform/"
export PATH="$PATH:$TOOLKIT"
export PREFIX=$START_DIR
# PRoot
export PROOT_TMP_DIR="$DATA2_DIR/cache/"
export PROOT_LOADER="$TOOLKIT/lib/$platform/lib_loader.so"
# x64 ?
if [[ "$platform" != "x86_64" ]]
then
echo "">/dev/null
else
export PROOT_LOADER_32="$TOOLKIT/lib/$platform/lib_loader32.so"
fi
#
# LoadConfig
#
export confid="$(cat $CONFIG_DIR/.id.conf)"
export cmd=$(cat $CONFIG_DIR/$confid/cmd.conf)
export rootfs=$(cat $CONFIG_DIR/$confid/rootfs.conf)
export PATH2=$(cat $CONFIG_DIR/$confid/path.conf)