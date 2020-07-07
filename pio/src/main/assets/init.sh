#!/system/bin/sh
script_path="$1"
#
export EXECUTOR_PATH=$({EXECUTOR_PATH})
export START_DIR=$({START_DIR})
export PACKAGE_NAME=$({PACKAGE_NAME})
export SDCARD_PATH=$({SDCARD_PATH})
#
export TOOLS=$({TOOLKIT})/toolkit/
export TOOLKIT=$({TOOLKIT})
# Config Loader
export DATA2_DIR=/$SDCARD_PATH/Android/data/$PACKAGE_NAME/
export CONFIG_DIR=$DATA2_DIR/config/
export LOG_EXPORT=/dev/null
export platform=$(sh $TOOLKIT/service.sh platform)
export confs=$(cat $CONFIG_DIR/.id.conf)
export confid=$(cat $CONFIG_DIR/.id.conf)
export cmd=$(cat $CONFIG_DIR/$confs/cmd.conf)
export rootfs=$(cat $CONFIG_DIR/$confs/rootfs.conf)

if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
    sh "$TOOLKIT/install_bin.sh"
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

if [ -d "$DATA2_DIR" ];then
  echo "">/dev/null
  else
  mkdir $DATA2_DIR/
fi

if [[ ! "$TOOLKIT" = "" ]]; then
    PATH="$PATH:$TOOLKIT"
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