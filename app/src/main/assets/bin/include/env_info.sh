# dogeland cli module
#
# license: gpl-v3
env_info() {
    
    android_version=$(getprop ro.build.version.release)
    if [ -n "$android_version" ]; then
        echo -n "Android: "
        echo "Android $android_version"
    fi

    echo -n "Container installed system:"
    if [ -f "$rootfs/etc/issue" ];then
    export linux_version=$(cat $rootfs/etc/issue)
    else
    export linux_version="  UnSupported"
    fi
    echo "$linux_version"

    echo -n "CPU Arch: "
    echo "$(uname -m)"

    echo -n "Linux: "
    echo "$(uname -r)"

    echo -n "RAM: "
    mem_status=$(sed -n '1,p' /proc/meminfo)
    echo "$mem_status"

    echo -n "SELinux: "
    selinux_inactive && echo "关闭" || echo "开启"

    echo "FS Support:"
    supported_fs=$(cat /proc/filesystems)
    echo "$supported_fs"
    
    echo 'busybox:'
    $TOOLKIT/busybox | grep BusyBox

    echo "RunDir:"
    pwd
    
    echo ""
    echo "CLI:"
    sh $TOOLKIT/cli.sh version

    echo "PRoot:"
    $TOOLKIT/proot -V

    echo "chroot:"
    $TOOLKIT/busybox chroot
}
