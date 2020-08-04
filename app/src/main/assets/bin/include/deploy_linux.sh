#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#

deploy_linux(){
deploy_linux_step1
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
deploy_linux_step2
}

deploy_linux1(){
deploy_linux_step1
#
# Install
#
echo "- 正在安装 $file"
rm -rf $rootfs2
mkdir $rootfs2/
if [ `id -u` -eq 0 ];then
 tar -XfJ $file -C $rootfs2 >/dev/null
else
 proot --link2symlink $TOOLKIT/busybox tar -XfJ $file -C $rootfs2 >/dev/null
fi
deploy_linux_step2
}



deploy_linux_step1(){
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
if [[ "$datas" != "1" ]]
then
echo "">/dev/null
else
echo "将安装到 /data/data/$PACKAGE_NAME/files/$rootfs2/"
sleep 3
export rootfs2="/data/data/$PACKAGE_NAME/files/$rootfs2/"
fi
}

deploy_linux_step2(){
# Check 
if [ -d "$rootfs2/bin/" ];then
  echo "">/dev/null
  else
  echo "!解压包时出现异常,请向开发者反馈"
  exit 255
  sleep 9999
fi
rm -rf $rootfs2/etc/dropbear
if [ -d "$rootfs2/etc/dropbear/" ];then
  mkdir $rootfs2/etc/dropbear/
  chmod -R 0777 $rootfs2/etc/dropbear/
  else
  echo "">/dev/null
fi
#
# Settings
#
echo "- 正在设置"
# Set CONFIG
echo "Stop">$rootfs2/status
rm -rf $CONFIG_DIR/cmd.conf
echo "$type">$CONFIG_DIR/cmd.conf
rm -rf $CONFIG_DIR/rootfs.conf
echo "$rootfs2" >$CONFIG_DIR/rootfs.conf
# mkdir
mkdir $rootfs2/sys
mkdir $rootfs2/dev
mkdir $rootfs2/proc
# Install CLI
cp $TOOLKIT/cli.sh $rootfs2/
mkdir $rootfs2/include/
cp -R $TOOLKIT/include/* $rootfs2/include/
# ReadRootfsInfo
echo "- 正在解析"
if [ -f "$rootfs2/info.log" ];then
cat $rootfs2/info.log
echo ""
else
echo "!解析系统包时出现异常,但这可能不会影响使用"
fi
echo "- 正在设置"
source $TOOLKIT/linux-setuptool.sh configure
echo "- 安装成功"
}