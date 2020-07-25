#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
shmem_patch(){
echo "正在安装补丁"
sh $TOOLKIT/cli.sh check_rootfs
cp $TOOLKIT/lib/$archs/libandroid-shmem.so $rootfs/usr/local/lib/
echo "安装完成"
}


xstartup_add(){
 echo '正在安装补丁'
 sed '$a\$desktop &' $rootfs/root/.vnc/xstartup
 echo "安装完成"
}

debiangroup_add(){
sed -i '$ a\aid_other:x:20233:' $rootfs/etc/group
sed -i '$ a\aid_other:x:50233:' $rootfs/etc/group
sed -i '$ a\aid_other:x:20245:' $rootfs/etc/group
sed -i '$ a\aid_other:x:50245:' $rootfs/etc/group
}

sh_patcher(){
rm -rf $rootfs/bin/sh
ln -s $rootfs/bin/bash $rootfs/bin/sh
echo "补丁安装成功"
}