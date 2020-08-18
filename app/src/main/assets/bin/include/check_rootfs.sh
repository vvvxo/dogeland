# dogeland cli module
#
# license: gpl-v3
check_rootfs(){
if [ -d "$rootfs" ];then
  echo "">/dev/null
  else
  echo "- / ...fail "
  exit 3
fi
}