#
# DogeLand-AppShell-Init
#
script="$1"
# BasicEnv
export TMPDIR=$START_DIR
# AppFrameInit
if [[ -f "$({TOOLKIT})/appframe_init.sh" ]]; then
  sh $({TOOLKIT})/appframe_init.sh
else
  echo "!无法初始化运行环境"
  exit 255
fi
if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
  sh $TOOLKIT/install_bin.sh
fi
if [[ -f "$script" ]]; then
    chmod 755 "$script"
    sh "$script"
else
    echo "!运行命令时出现异常"
fi