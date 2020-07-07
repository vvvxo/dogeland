1()
{
echo "正在读取预安装配置...."
rootfs2=$(cat $TOOLKIT/bootstrap/system/status2.txt)
file=$(cat $TOOLKIT/bootstrap/system/status.txt)
echo "正在释放系统包 $file 到 $rootfs2/"
rm -rf $rootfs2
mkdir $rootfs2
tar zxvf $file -C $rootfs2/ >/dev/null
rm -rf $rootfs2/sys/*
rm -rf $rootfs2/dev/*
rm -rf $rootfs2/proc/*
systype=$(cat $rootfs2/etc/issue)
echo "正在设置配置文件...."
rm $CONFIG_DIR/$confs/rootfs.conf
echo "$rootfs2">$CONFIG_DIR/$confs/rootfs.conf
echo "$systype 安装成功"
}
0(){
echo
}
sleep 1
1