#
# DogeLand CLI
# v2.1.6
# 
# license: GPL-v2.0
#
VERSION=2.1.6_DEBUG
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
if [ -d "/data/data/me.flytree.dogeland/files/bin/" ];then
  TOOLKIT=./
  else
  echo "">/dev/null
fi

load_mod(){
if [ -f "$TOOLKIT/include/$mod" ];then
source $TOOLKIT/include/$mod
else
echo "!$mod 未生效."
fi
}
#
# Core
#
mod=core/custom.sh
load_mod
unset mod

mod=core/version.sh
load_mod
unset mod

mod=core/help.sh
load_mod
unset mod

mod=core/stop_rootfs.sh
load_mod
unset mod

mod=core/del_rootfs.sh
load_mod
unset mod

mod=core/env_info.sh
load_mod
unset mod

mod=core/platform.sh
load_mod
unset mod

mod=core/mount_part.sh
load_mod
unset mod

mod=core/umount_part.sh
load_mod
unset mod

mod=core/loop_support.sh
load_mod
unset mod

mod=core/selinux_inactive.sh
load_mod
unset mod

mod=core/set_all.sh
load_mod
unset mod

mod=core/set_env.sh
load_mod
unset mod

mod=core/check_rootfs.sh
load_mod
unset mod

mod=core/del_rootfs.sh
load_mod
unset mod

mod=core/backup_rootfs.sh
load_mod
unset mod

mod=core/deploy_linux.sh
load_mod
unset mod

mod=start/chroot.sh
load_mod
unset mod

mod=start/proot.sh
load_mod
unset mod

mod=start/termux-proot.sh
load_mod
unset mod

mod=start/auto.sh
load_mod
unset mod

mod=exec/chroot.sh
load_mod
unset mod

mod=exec/proot.sh
load_mod
unset mod

mod=exec/termux-proot.sh
load_mod
unset mod

mod=exec/auto.sh
load_mod
unset mod

mod=exec/local-shell.sh
load_mod
unset mod

mod=core/plugin.sh
load_mod
unset mod
#
# extensions
#
mod=linux/dropbear.sh
load_mod
unset mod

mod=linux/sshd.sh
load_mod
unset mod

mod=linux/vncserver.sh
load_mod
unset mod

mod=linux/patcher.sh
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
