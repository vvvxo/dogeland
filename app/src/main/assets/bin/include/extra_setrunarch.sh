# dogeland cli module
#
# license: gpl-v3
set_runarch(){
echo "- 正在设置 $type ..."
sed "24c export platform=$type" $START_DIR/shell_init.sh
if [[ -f "$TMPDIR/install_bin.shbak" ]]; then
  . $TMPDIR/install_bin.shbak
fi
if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
  . $TOOLKIT/install_bin.sh
fi
}
$@