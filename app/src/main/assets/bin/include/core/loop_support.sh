#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
loop_support() {
    if [ -n "$(losetup -f)" ]; then
        return 1
    else
        return 0
    fi
}