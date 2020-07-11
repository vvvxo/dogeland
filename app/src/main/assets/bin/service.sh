# DogeLand Service
# v2.0.4
# 
# license: 
#
VERSION=2.0.4-alpha
#
# Common
#
msg()
{
    echo "$@"
}
platform()
{
    local arch="$1"
    if [ -z "${arch}" ]; then
        arch=$(uname -m)
    fi
    case "${arch}" in
    arm64|aarch64)
        msg "arm_64"
    ;;
    arm*)
        msg "arm"
    ;;
    x86_64|amd64)
        msg "x86_64"
    ;;
    i[3-6]86|x86)
        msg "x86"
    ;;
    *)
        msg "unknown" && exit 255
    ;;
    esac
}

#
# Core
#

# mount
mount_part(){
if [ -d "$rootfs/" ];then
  msg "">/dev/null
  else
  msg "- / ...fail "
  exit
fi
if [ -d "$rootfs/proc/1/" ];then
 msg "">/dev/null
  else
 msg "- /proc ..."
   mount -o bind /proc $rootfs/proc
fi
if [ -d "$rootfs/sys/kernel/" ];then
 msg "">/dev/null
  else
 msg "- /sys ..."
  mount -o bind /sys $rootfs/sys
fi
if [ -d "$rootfs/sdcard/" ];then
  msg "">/dev/null
  else
  msg "- /sdcard ..."
  mount -o bind -t sdcardfs $rootfs/sdcard
fi
if [ -d "$rootfs/dev/block/" ];then
  msg "">/dev/null
  else
  msg "- /dev ..."
  mount -o bind /dev/ $rootfs/dev
fi
msg "- /dev/shm ..."
mount -o bind /dev/shm $rootfs/dev/shm
msg "- /dev/pts ..."
mount -o bind /dev/pts $rootfs/dev/pts

#if [ ! -e "/dev/fd" -o ! -e "/dev/stdin" -o ! -e "/dev/stdout" -o ! -e "/dev/stderr" ]; then
# msg "/dev/fd ... "
#  [ -e "/dev/fd" ] || ln -s /proc/self/fd /dev/
#  [ -e "/dev/stdin" ] || ln -s /proc/self/fd/0 /dev/stdin
#  [ -e "/dev/stdout" ] || ln -s /proc/self/fd/1 /dev/stdout
#  [ -e "/dev/stderr" ] || ln -s /proc/self/fd/2 /dev/stderr
#fi

if [ ! -e "/dev/tty0" ]; then
  msg "">/dev/null
  else
  msg "/dev/tty ... "
  ln -s /dev/null /dev/tty0
fi

#if [ ! -e "/dev/net/tun" ]; then
#   msg -n "/dev/net/tun ... "
#   [ -d "/dev/net" ] || mkdir -p /dev/net
#   mknod /dev/net/tun c 10 200
#fi
}

# umount

# loop
loop_support() {
    if [ -n "$(losetup -f)" ]; then
        msg "你的设备不支持loop,无法挂载镜像"
        exit
    else
        msg ""
    fi
}
#
# Loader
#
set_env(){
unset TMP TEMP TMPDIR LD_PRELOAD LD_DEBUG
HOME=/root
LANG=C.UTF-8
PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games
}

start_chroot(){
mount_part
set_env
$TOOLKIT/busybox chroot $rootfs $cmd $addcmd
msg "- All Done"
sleep 1
}

start_auto(){
msg
if [ `id -u` -eq 0 ];then
   start_chroot
   exit
else
   echo "">/dev/null
fi
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  start_proot_termux
  exit
  else
  start_proot
  exit
fi
sleep 1
}

start_proot(){
set_env
$TOOLKIT/proot -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd $addcmd
msg "- Done"
sleep 1
}

start_proot_termux(){
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  echo ""
  else
  echo "- 不支持的操作"
  exit 255
fi
set_env
/data/data/com.termux/files/usr/bin/proot -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root $cmd $addcmd
msg "- Done"
sleep 1
}

stop_rootfs(){
pkill sshd
pkill sh
}
#
# Linux Exec
#

exec_chroot(){
mount_part
set_env
msg "- Pushing"
msg "$cmd2">$rootfs/runcmd.sh
chmod 0777 $rootfs/runcmd.sh
msg
msg
msg "- Running"
msg
msg
$TOOLKIT/chroot "$rootfs" /bin/su -c $userid /runcmd.sh
msg
msg "- Cleaning"
rm $rootfs/runcmd.sh
}

exec_auto(){
msg
if [ `id -u` -eq 0 ];then
   exec_chroot
   exit
else
   echo "">/dev/null
fi
if [ -f "/data/data/com.termux/files/usr/bin/" ];then
  exec_proot_termux
  exit
  else
  exec_proot
  exit
fi
sleep 1
}

exec_proot(){
set_env
msg "- Pushing"
msg "$cmd2">$rootfs/runcmd.sh
chmod 0777 $rootfs/runcmd.sh
msg
msg "- Running"
msg ""
$TOOLKIT/proot -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root /bin/su -c $userid /runcmd.sh
msg
msg "- Cleaning"
rm -rf $rootfs/runcmd.sh
}

exec_proot_termux(){
if [ -f "/data/data/com.termux/files/usr/bin/proot" ];then
  echo ""
  else
  echo "- 不支持的操作"
  exit 255
fi
set_env
msg "- Pushing"
msg "$cmd2">$rootfs/runcmd.sh
chmod 0777 $rootfs/runcmd.sh
msg
msg "- Running"
msg ""
/data/data/com.termux/files/usr/bin/proot -0 -r $rootfs -b /dev -b /proc -b /sys -b /sdcard -b $rootfs/root:/dev/shm  -w /root /bin/su -c $userid /runcmd.sh
msg
msg "- Cleaning"
rm $rootfs/runcmd.sh
}

exec_localshell(){
sleep 1
$cmd2
}
#
# Other
#
deploy_linux(){
$TOOLS/debootstrap --help
}

rm_rootfsdir() {
msg "- 正在取消挂载"
umount
msg "- 正在删除"
rm -rf $rootfs/*
msg "- 删除完成"
}

help() {
cat <<HELP

USAGE:
   service.sh COMMAND ...

COMMANDS:
   [...] 
   
   start_chroot: 使用chroot启动Linux
   start_proot: 使用proot启动Linux
   
   exec_chroot: 使用chroot运行Linux命令
   exec_proot: 使用proot运行Linux命令
   
   set_env: 设置Linux运行环境
   
HELP
}

about()
{
cat <<ABOUT

DogeLand Service
版本: $VERSION

本应用程序安装指定的 GNU / Linux 发行版 , 并在chroot或proot容器中运行.

 https://github.com/Flytreels/LinuxLoader

license:

ABOUT
}

#
# Linux
#

#
# sshd
#
sshd_start()
{
msg "- sshd::start..."
if [ $(ls "/etc/ssh/" | grep -c key) -eq 0 ]; then
   ssh-keygen -A >/dev/null
fi
rm -rf /run/sshd
rm -rf /var/run/sshd
mkdir /run/sshd /var/run/sshd
ssh-keygen -A
/usr/sbin/sshd -p 22
}

sshd_stop()
{
msg "- sshd::stop..."
kill -9 /run/sshd.pid /var/run/sshd.pid
pkill sshd
}

sshd_config()
{
msg
}


#
# Config
#
set_tempdir() {
    if [ ! -n "$Input" ]; then
    msg "- 检测到没有输入内容,取消更改."
    else
    msg "- 正在更改"
    sleep 1
    rm -rf $CONFIG_DIR/$confid/tmpdir.conf
    msg "$Input">$CONFIG_DIR/$confid/tmpdir.conf
    msg "- 完成"
    sleep 1
    exit
fi
}

set_rootfsdir() {
if [ ! -n "$Input" ]; then
msg "- 检测到没有输入内容,取消更改."
    else
    msg "- 正在修改Rootfs路径"
    rm -rf $CONFIG_DIR/$confid/rootfs.conf
    msg "$Input">$CONFIG_DIR/$confid/rootfs.conf
    msg "- 完成,已设置 $Input"
    fi
}

set_initcmd() {
if [ ! -n "$Input" ]; then
 msg "- 检测到没有输入内容,取消更改."
else
 msg "- 正在修改"
 rm -rf $CONFIG_DIR/$confid/cmd.conf
 msg "$Input">$CONFIG_DIR/$confid/cmd.conf
 msg "- 完成,已修改 $Input"
fi
}

mk_conf() {
if [ -d "$CONFIG_DIR/" ];then
  echo
  else
  mkdir $CONFIG_DIR
fi
msg "- 正在创建配置 $mkconf"
mkdir $CONFIG_DIR/$mkconf/
msg "/data/cache/linux">$CONFIG_DIR/$mkconf/rootfs.conf
msg "/bin/sh">$CONFIG_DIR/$mkconf/cmd.conf
echo "- 正在切换配置 $mkconf"
rm $CONFIG_DIR/.id.conf
msg "$mkconf">$CONFIG_DIR/.id.conf
msg '- 完成,已创建 $mkconf'
exit
}

del_conf() {
if [ ! -n "$delconf" ]; then
  msg "- 检测到没有输入内容,取消更改."
else
  msg "- 正在删除配置 $delconf"
  sleep 1
  rm -rf $CONFIG_DIR/$delconf
  msg "- 完成,已删除 $delconf"
  sleep 1
  exit
fi
}

sw_conf() {
if [ ! -n "$swconf" ]; then
  msg "- 检测到没有输入内容,取消更改."
else
  msg "- 正在切换配置 $swconf"
  sleep 1
  rm -rf $CONFIG_DIR/.id.conf
  msg "$swconf">$CONFIG_DIR/.id.conf
  msg "- 完成,已切换 $swconf"
  sleep 1
  exit
fi
}
#
# Other
#

var() {
msg '核心框架定义'
msg ''
msg "EXECUTOR_PATH=$EXECUTOR_PATH"
msg "START_DIR=$START_DIR"
msg "TEMP_DIR=$TEMP_DIR"
msg "ANDROID_UID=$ANDROID_UID"
msg "ANDROID_SDK=$ANDROID_SDK"
msg "SDCARD_PATH=$SDCARD_PATH"
msg "TOOLKIT=$TOOLKIT"
sleep 1
msg 'env 命令:'
env
msg ''
sleep 1

msg 'set 命令'
msg ''
set
msg ''
sleep 1

msg 'export -p 命令'
msg ''
export -p
msg ''
msg ''
msg ''
sleep 1
}

# Run Command

export platform=$(platform)
if [ ! -n "${1}" ]; then
  about
  help
  exit
fi
umask 000
${1}