# dogeland cli module
#
# license: gpl-v3
shmem_patch(){
echo "正在安装补丁"
check_rootfs
cp $PREFIX/lib/libandroid-shmem.so $rootfs/usr/local/lib/
echo "安装完成"
}


xstartup_add(){
check_rootfs
 echo '正在安装补丁'
 sed "$a\$desktop &" $rootfs/root/.vnc/xstartup
 echo "安装完成"
}

debiangroup_add(){
check_rootfs
echo "将修复 $bug group组缺失问题"
sed -i "$ a\aid_other:x:$bug:" $rootfs/etc/group
}

sh_patcher(){
check_rootfs
rm -rf $rootfs/bin/sh
ln -s $rootfs/bin/bash $rootfs/bin/sh
echo "补丁安装成功"
}
enable_proot_seccomp(){
sed -i '29i\PROOT_NO_SECCOMP=1' $START_DIR/exec_start.sh
}
fix_sudo(){
rm -rf $rootfs/bin/sudo $rootfs/sbin/sudo $rootfs/usr/bin/sudo $rootfs/usr/sbin/sudo
echo "su -c $@">$rootfs/bin/sudo
chmod 0777 $rootfs/bin/sudo
}