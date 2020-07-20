#
# DogeLand CLI
# v2.1.3
# 
# license: GPL-v2.0
#
VERSION=2.1.3_BETA
#
# Common
#
if [ -d "/usr/" ];then
  unset TOOLKIT
  else
  echo "">/dev/null
fi
source $TOOLKIT/include/core/version.sh
source $TOOLKIT/include/core/help.sh
source $TOOLKIT/include/core/stop_rootfs.sh
source $TOOLKIT/include/core/env_info.sh
source $TOOLKIT/include/core/platform.sh
source $TOOLKIT/include/core/mount_part.sh
source $TOOLKIT/include/core/loop_support.sh
source $TOOLKIT/include/core/selinux_inactive.sh
source $TOOLKIT/include/core/set_all.sh
source $TOOLKIT/include/core/set_env.sh
source $TOOLKIT/include/core/check_rootfs.sh
source $TOOLKIT/include/core/del_rootfs.sh
source $TOOLKIT/include/core/deploy_linux.sh
source $TOOLKIT/include/start/chroot.sh
source $TOOLKIT/include/start/proot.sh
source $TOOLKIT/include/start/termux-proot.sh
source $TOOLKIT/include/start/auto.sh
source $TOOLKIT/include/exec/chroot.sh
source $TOOLKIT/include/exec/proot.sh
source $TOOLKIT/include/exec/termux-proot.sh
source $TOOLKIT/include/exec/local-shell.sh
source $TOOLKIT/include/exec/auto.sh
source $TOOLKIT/include/linux/dropbear.sh
source $TOOLKIT/include/linux/sshd.sh
if [ ! -n "${1}" ]; then
  version
fi
umask 000
${1}
