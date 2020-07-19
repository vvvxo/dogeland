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
  return 0 && sleep 1000
fi
}