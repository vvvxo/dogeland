#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
check_rootfs(){
if [ -d "$rootfs" ];then
  echo "">/dev/null
  else
  echo "- / ...fail "
  exit 255
fi
}