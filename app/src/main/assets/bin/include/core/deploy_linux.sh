#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
deploy_linux(){
echo "- 正在检查"
if [ ! -n "$rootfs2" ]; then
    echo "- 无效安装路径"
    exit 255
    sleep 1000
    else
    echo "">/dev/null
fi
if [ ! -n "$file" ]; then
    echo "- 无效系统包文件"
    exit 255
    sleep 1000
    else
    echo "">/dev/null
fi
#
# Install
#
echo "- 正在安装 $file"
rm -rf $rootfs2
mkdir $rootfs2/
if [ `id -u` -eq 0 ];then
 tar -xzvf $file -C $rootfs2 >/dev/null
else
 proot --link2symlink $TOOLKIT/busybox tar -xzvf $file -C $rootfs2 >/dev/null
fi
#
# Settings
#
echo "- 正在设置"
export rootfs=$rootfs2
source $TOOLKIT/linux-deploytool.sh configure
}
