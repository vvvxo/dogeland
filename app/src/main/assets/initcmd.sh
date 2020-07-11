#!/system/bin/sh
script_path="$1"
# Core
export EXECUTOR_PATH=$({EXECUTOR_PATH})
export START_DIR=$({START_DIR})
export PACKAGE_NAME=$({PACKAGE_NAME})
export SDCARD_PATH=$({SDCARD_PATH})
export TOOLKIT=$({TOOLKIT})
export PATH="$PATH:$TOOLKIT"
export TOOLS=$({TOOLKIT})/toolkit/
export DATA2_DIR=/$SDCARD_PATH/Android/data/$PACKAGE_NAME/
export platform=$(sh $TOOLKIT/service.sh platform)
# PRoot
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TOOLKIT/lib/$platform/
export PROOT_TMP_DIR=$TOOLKIT
export PROOT_LOADER=$TOOLKIT/lib/$platform/lib_loader.so
export PROOT_LOADER_32=$TOOLKIT/lib/$platform/lib_loader32.so
# Config
export CONFIG_DIR=$DATA2_DIR/config/
export confs=$(cat $CONFIG_DIR/.id.conf)
export confid=$confs
export cmd=$(cat $CONFIG_DIR/$confs/cmd.conf)
export rootfs=$(cat $CONFIG_DIR/$confs/rootfs.conf)
# Run Command

if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
  sh $TOOLKIT/install_bin.sh
fi

if [[ -f "$CONFIG_DIR/$confs/rootfs.conf" ]]; then
  echo "">/dev/null
  else
  echo "!无法加载配置文件 rootfs.conf"
  sleep 1
fi

if [[ -f "$CONFIG_DIR/$confs/cmd.conf" ]]; then
  echo "">/dev/null
  else
  echo "!无法加载配置文件 cmd.conf"
  sleep 1
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