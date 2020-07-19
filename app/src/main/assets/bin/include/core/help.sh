#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
help() {
cat <<HELP

USAGE:
   cli.sh [COMMAND] ...

COMMANDS:
   [...] 
   
   start_chroot: 使用chroot启动Linux
   start_proot: 使用proot启动Linux
   
   exec_chroot: 使用chroot运行Linux命令
   exec_proot: 使用proot运行Linux命令
   
   set_env: 设置Linux终端环境
   
   env_info: 运行环境测试
   
HELP
}