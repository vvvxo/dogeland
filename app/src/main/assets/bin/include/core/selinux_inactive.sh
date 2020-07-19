#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
selinux_inactive()
{
    if [ -e "/sys/fs/selinux/enforce" ]; then
        return $(cat /sys/fs/selinux/enforce)
    else
        return 0
    fi
}