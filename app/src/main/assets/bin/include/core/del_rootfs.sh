#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
del_rootfs() {
echo "- 正在取消挂载"
umount_part
echo "- 正在删除"
rm -rf $rootfs/*
echo "- 删除完成"
}
