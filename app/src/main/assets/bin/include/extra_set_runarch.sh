set_runarch(){
echo "- 正在设置 $type ..."
sed "20c export platform=$type" $START_DIR/exec_start.sh
echo "- 正在应用更改.."
sleep 1
echo "#"
echo "# DogeLand Core Files ReInstaller"
echo "#"
sleep 1
if [[ -f "$TMPDIR/install_bin.shbak" ]]; then
  . $TMPDIR/install_bin.shbak
fi
if [[ -f "$TOOLKIT/install_bin.sh" ]]; then
  . $TOOLKIT/install_bin.sh
fi
}
$@