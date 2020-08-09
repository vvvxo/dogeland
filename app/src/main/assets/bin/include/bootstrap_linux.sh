bootstrap_archarm(){
echo "- 正在从 $repo 安装 ArchLinux $archs ..."
curl -O $repo/os/ArchLinuxARM-$archs-latest.tar.gz
echo "- 正在安装 ArchLinux ..."
export datas=1
export file=$(pwd)/ArchLinuxARM-$archs-latest.tar.gz
export rootfs2="archlinux-fs/"
sh $TOOLKIT/cli.sh deploy_linux
rm -rf ArchLinuxARM-$archs-latest.tar.gz
echo "- 正在执行附加操作"
cmd2="pacman -Sy dropbear"
exec_auto
unset cmd2
echo "- 已完成"
}
bootstrap_manjaroarm(){
echo "- 正在从 $repo 安装 Manjaro $archs ..."
curl -O $repo/osdn/storage/g/m/ma/manjaro-arm/.rootfs/Manjaro-ARM-$archs-latest.tar.gz
echo "- 正在安装 Manjaro ..."
export datas=1
export file=$(pwd)/Manjaro-ARM-$archs-latest.tar.gz
export rootfs2="manjaro-fs/"
sh $TOOLKIT/cli.sh deploy_linux
rm -rf Manjaro-ARM-$archs-latest.tar.gz
echo "- 正在执行附加操作"
cmd2="pacman -Sy dropbear"
exec_auto
unset cmd2
echo "- 已完成"
}