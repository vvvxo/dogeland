1()
{
echo "正在读取预安装配置...."
sleep 1
exec=$TOOLKIT/service.sh exec_chroot
echo "正在启动容器并安装ssh...."
sleep 1
echo "安装完成"
}
0(){
sleep 1
}
$@