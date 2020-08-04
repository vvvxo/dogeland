#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
check_rootfs(){
if [ -d "$rootfs" ];then
  return 1
  else
  echo "- / ...fail "
  sleep 9999
fi
}