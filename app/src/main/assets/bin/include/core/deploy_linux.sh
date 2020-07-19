#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
deploy_linux(){
echo "- 正在检查配置"
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
if [ ! -n "$cliconf" ]; then
    echo "- 无效系统配置文件"
    exit 255
    sleep 1000
    else
    echo "">/dev/null
fi
echo "- 正在安装 $file 系统包"
rm -rf $rootfs2
mkdir $rootfs2/
if [ `id -u` -eq 0 ];then
 tar -xzvf $file -C $rootfs2 >/dev/null
else
echo "前排提示:部分设备无ROOT解压过程会大量报错导致卡死界面"
echo "耐心等待,不要停止运行,等待3分钟强制停止即可"
sleep 3
 proot --link2symlink $TOOLKIT/busybox tar -xzvf $file -C $rootfs2 >/dev/null
fi
echo "- 正在设置相关文件"
sh $TOOLKIT/linuxdeploy-cli/cli.sh -p $cliconf deploy -c >/dev/null
mkdir $rootfs2/sys
mkdir $rootfs2/dev
mkdir $rootfs2/proc
mkdir $rootfs2/mnt
echo "- 正在执行附加操作"
rm -rf $CONFIG_DIR/$confid/rootfs.conf
echo "$rootfs2" >$CONFIG_DIR/$confid/rootfs.conf
cp $TOOLKIT/cli.sh $rootfs2/
rm -rf $CONFIG_DIR/$confid/cmd.conf
echo "/bin/bash /cli.sh sshd_start">$CONFIG_DIR/$confid/cmd.conf
echo "- 正在解析系统信息"
if [ -f "$rootfs2/info.log" ];then
cat $rootfs2/info.log
else
echo "- 找不到文件,可能不是官方包或者包损坏也可能解压失败"
fi
echo "- 安装成功"
}