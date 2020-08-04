#
# DogeLand CLI
# v2.1.7
# 
# license: GPL-v2.0
#
VERSION=2.1.7_DEBUG
#
# Common
#

# Check Linux Env
if [ -d "/usr/" ];then
  unset TOOLKIT
  else
  echo "">/dev/null
fi
# Check Linux or Android Env
if [ ! -n "$START_DIR" ]; then
  TOOLKIT=./
export START_DIR=./
export PREFIX=$PREFIX:./
export TOOLKIT=./
export DATA2_DIR="./data/"
export CONFIG_DIR="$DATA2_DIR/config/"
else
  echo "">/dev/null
fi
# Utils
load_mod(){
if [ -f "$mod" ];then
. $mod
else
echo "!$mod 未生效."
fi
}
#
# LoadList
#
mod=$TOOLKIT/include/custom.sh
load_mod
unset mod

mod=$TOOLKIT/include//version.sh
load_mod
unset mod

mod=$TOOLKIT/include//help.sh
load_mod
unset mod

mod=$TOOLKIT/include//stop_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include//del_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include//env_info.sh
load_mod
unset mod

mod=$TOOLKIT/include//platform.sh
load_mod
unset mod

mod=$TOOLKIT/include//mount_part.sh
load_mod
unset mod

mod=$TOOLKIT/include//umount_part.sh
load_mod
unset mod

mod=$TOOLKIT/include//loop_support.sh
load_mod
unset mod

mod=$TOOLKIT/include//selinux_inactive.sh
load_mod
unset mod

mod=$TOOLKIT/include//set_all.sh
load_mod
unset mod

mod=$TOOLKIT/include//set_env.sh
load_mod
unset mod

mod=$TOOLKIT/include//check_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include//del_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include//backup_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include//deploy_linux.sh
load_mod
unset mod
#
# Starter
#
mod=$TOOLKIT/include//starter_chroot.sh
load_mod
unset mod

mod=$TOOLKIT/include//starter_proot.sh
load_mod
unset mod

mod=$TOOLKIT/include//starter_termux-proot.sh
load_mod
unset mod

mod=$TOOLKIT/include//starter_auto.sh
load_mod
unset mod
#
# Exec
#
mod=$TOOLKIT/include//exec_chroot.sh
load_mod
unset mod

mod=$TOOLKIT/include//exec_proot.sh
load_mod
unset mod

mod=$TOOLKIT/include//exec_termux-proot.sh
load_mod
unset mod

mod=$TOOLKIT/include//exec_auto.sh
load_mod
unset mod

mod=$TOOLKIT/include//exec_local-shell.sh
load_mod
unset mod


#
# extensions
#

mod=$TOOLKIT/include//add_plugin.sh
load_mod
unset mod

mod=$TOOLKIT/include//extra_dropbear.sh
load_mod
unset mod

mod=$TOOLKIT/include//extra_sshd.sh
load_mod
unset mod

mod=$TOOLKIT/include//extra_vncserver.sh
load_mod
unset mod

mod=$TOOLKIT/include//extra_patcher.sh
load_mod
unset mod

# RunHelp
if [ ! -n "${1}" ]; then
  version
fi
# Set Permission
umask 000
# RunCmd
${1}
