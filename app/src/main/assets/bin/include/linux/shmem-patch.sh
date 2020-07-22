shmem_patch(){
echo "正在安装补丁"
sh $TOOLKIT/cli.sh check_rootfs
cp $TOOLKIT/lib/$archs/libandroid-shmem.so $rootfs/usr/local/lib/
echo "安装完成"
}