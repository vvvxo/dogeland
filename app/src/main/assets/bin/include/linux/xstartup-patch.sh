xstartup_add(){
 echo '正在安装补丁'
 sed '$a\$desktop' $rootfs/root/.vnc/xstartup
 echo "安装完成"
}