bootstrap_linux2(){
. $TOOLKIT/bootstrap_arch.sh -a $archs -r $repo -d $rootfs2 $rootfs2
cmd2="pacman -S dropbear"
exec_auto
unset cmd2
deploy_linux_step2
}