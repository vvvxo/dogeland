# dogeland cli module
#
# license: gpl-v3
version()
{
cat <<ABOUT

dogeland CLI $VERSION 

license: GPL-v3.0

ABOUT
}
help() {
cat <<HELP

USAGE:
   cli.sh [COMMAND] ...

COMMANDS:
   [...] 
   
   start_chroot: 使用chroot启动Linux
   start_proot: 使用proot启动Linux
   start_auto: 启动Linux
   
   exec_chroot: 使用chroot运行Linux命令
   exec_proot: 使用proot运行Linux命令
   exec_auto: 运行Linux命令
   
   del_rootfs: 删除Rootfs
   stop_rootfs: 停止Linux容器运行
   set_env: 设置Linux终端环境
   loop_support: 检查设备是否支持loop
   mount_part: 挂载内核分区到Rootfs
   umount_part: 取消挂载内核分区到Rootfs
   selinux_inactive: 检查SeLinux状态
   env_info: 运行环境测试
   deploy_linux: 安装Linux系统包
   backup_rootfs: 备份Rootfs
   
   ...其他就你自己挖掘把
   
HELP
}