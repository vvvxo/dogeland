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
echo "将修复 $bug group组缺失问题"
sed -i '$ a\aid_other:x:$bug:' $rootfs/etc/group
}

sh_patcher(){
rm -rf $rootfs/bin/sh
ln -s $rootfs/bin/bash $rootfs/bin/sh
echo "补丁安装成功"
}
enable_proot_seccomp(){
sed -i '29i\PROOT_NO_SECCOMP=1' $START_DIR/exec_start.sh
}