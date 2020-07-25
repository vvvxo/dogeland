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

# Check LinuxEnv
if [ -d "/usr/" ];then
  unset TOOLKIT
  else
  echo "">/dev/null
fi
# Check LinuxHost or Android Env
if [ ! -n "$START_DIR" ]; then
  TOOLKIT=./
else
  echo "">/dev/null
fi


load_mod(){
if [ -f "$mod" ];then
source $mod
else
echo "!$mod 未生效."
fi
}
#
# Core
#
mod=$TOOLKIT/include/core/custom.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/version.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/help.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/stop_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/del_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/env_info.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/platform.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/mount_part.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/umount_part.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/loop_support.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/selinux_inactive.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/set_all.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/set_env.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/check_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/del_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/backup_rootfs.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/deploy_linux.sh
load_mod
unset mod

mod=$TOOLKIT/include/start/chroot.sh
load_mod
unset mod

mod=$TOOLKIT/include/start/proot.sh
load_mod
unset mod

mod=$TOOLKIT/include/start/termux-proot.sh
load_mod
unset mod

mod=$TOOLKIT/include/start/auto.sh
load_mod
unset mod

mod=$TOOLKIT/include/exec/chroot.sh
load_mod
unset mod

mod=$TOOLKIT/include/exec/proot.sh
load_mod
unset mod

mod=$TOOLKIT/include/exec/termux-proot.sh
load_mod
unset mod

mod=$TOOLKIT/include/exec/auto.sh
load_mod
unset mod

mod=$TOOLKIT/include/exec/local-shell.sh
load_mod
unset mod

mod=$TOOLKIT/include/core/plugin.sh
load_mod
unset mod
#
# extensions
#
mod=$TOOLKIT/include/linux/dropbear.sh
load_mod
unset mod

mod=$TOOLKIT/include/linux/sshd.sh
load_mod
unset mod

mod=$TOOLKIT/include/linux/vncserver.sh
load_mod
unset mod

mod=$TOOLKIT/include/linux/patcher.sh
load_mod
unset mod

# RunHelp
if [ ! -n "${1}" ]; then
  version
  help
fi
# Set Permission
umask 000
# RunCmd
${1}
