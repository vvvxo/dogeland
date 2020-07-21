#
# DogeLand CLI
# v2.1.5
# 
# license: GPL-v2.0
#
VERSION=2.1.5_DEBUG
#
# Common
#
if [ -d "/usr/" ];then
  unset TOOLKIT
  else
  echo "">/dev/null
fi
if [ -f "$TOOLKIT/include/core/custom.sh" ];then
source $TOOLKIT/include/core/custom.sh
else
echo "">/dev/null
fi
if [ -f "$TOOLKIT/include/core/version.sh" ];then
source $TOOLKIT/include/core/version.sh
else
echo "!core/version.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/help.sh" ];then
source $TOOLKIT/include/core/help.sh
else
echo "!core/help.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/stop_rootfs.sh" ];then
source $TOOLKIT/include/core/stop_rootfs.sh
else
echo "!core/stop_rootfs.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/env_info.sh" ];then
source $TOOLKIT/include/core/env_info.sh
else
echo "!core/env_info.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/platform.sh" ];then
source $TOOLKIT/include/core/platform.sh
else
echo "!core/platform.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/mount_part.sh" ];then
source $TOOLKIT/include/core/mount_part.sh
else
echo "!core/mount_part.sh未生效."
fi

if [ -f "$TOOLKIT/include/core/umount_part.sh" ];then
source $TOOLKIT/include/core/umount_part.sh
else
echo "!core/umount_part.sh未生效."
fi

if [ -f "$TOOLKIT/include/core/loop_support.sh" ];then
source $TOOLKIT/include/core/loop_support.sh
else
echo "!core/loop_support.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/selinux_inactive.sh" ];then
source $TOOLKIT/include/core/selinux_inactive.sh
else
echo "!core/selinux_inactive.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/set_all.sh" ];then
source $TOOLKIT/include/core/set_all.sh
else
echo "!core/set_all.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/set_env.sh" ];then
source $TOOLKIT/include/core/set_env.sh
else
echo "!core/set_env.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/check_rootfs.sh" ];then
source $TOOLKIT/include/core/check_rootfs.sh
else
echo "!core/check_rootfs.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/del_rootfs.sh" ];then
source $TOOLKIT/include/core/del_rootfs.sh
else
echo "!core/del_rootfs.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/backup_rootfs.sh" ];then
source $TOOLKIT/include/core/backup_rootfs.sh
else
echo "!core/backup_rootfs.sh 未生效."
fi
if [ -f "$TOOLKIT/include/core/deploy_linux.sh" ];then
source $TOOLKIT/include/core/deploy_linux.sh
else
echo "!core/deploy_linux.sh 未生效."
fi
if [ -f "$TOOLKIT/include/start/chroot.sh" ];then
source $TOOLKIT/include/start/chroot.sh
else
echo "!start/chroot.sh 未生效."
fi
if [ -f "$TOOLKIT/include/start/proot.sh" ];then
source $TOOLKIT/include/start/proot.sh
else
echo "!start/proot.sh未生效."
fi
if [ -f "$TOOLKIT/include/start/termux-proot.sh" ];then
source $TOOLKIT/include/start/termux-proot.sh
else
echo "!start/termux-proot.sh 未生效."
fi
if [ -f "$TOOLKIT/include/start/auto.sh" ];then
source $TOOLKIT/include/start/auto.sh
else
echo "!start/auto.sh 未生效."
fi
if [ -f "$TOOLKIT/include/exec/chroot.sh" ];then
source $TOOLKIT/include/exec/chroot.sh
else
echo "!exec/chroot.sh 未生效."
fi
if [ -f "$TOOLKIT/include/exec/proot.sh" ];then
source $TOOLKIT/include/exec/proot.sh
else
echo "!exec/proot.sh 未生效."
fi
if [ -f "$TOOLKIT/include/exec/termux-proot.sh" ];then
source $TOOLKIT/include/exec/termux-proot.sh
else
echo "!exec/termux-proot.sh 未生效."
fi
if [ -f "$TOOLKIT/include/exec/local-shell.sh" ];then
source $TOOLKIT/include/exec/local-shell.sh
else
echo "!exec/local-shell.sh 未生效."
fi
if [ -f "$TOOLKIT/include/exec/auto.sh" ];then
source $TOOLKIT/include/exec/auto.sh
else
echo "!exec/auto.sh 未生效."
fi
if [ -f "$TOOLKIT/include/linux/dropbear.sh" ];then
source $TOOLKIT/include/linux/dropbear.sh
else
echo "!linux/dropbear.sh 未生效."
fi
if [ -f "$TOOLKIT/include/linux/sshd.sh" ];then
source $TOOLKIT/include/linux/sshd.sh
else
echo "!linux/sshd.sh 未生效."
fi
if [ ! -n "${1}" ]; then
  version
fi
umask 000
${1}
