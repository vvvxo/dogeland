if [[ $SDK -ge 23 ]]; then
    echo "检测到Android7以下系统,此版本仅支持Android6+"
    echo "------"
    echo "请去Github搜DogeLand下载适用于Android5+的版本"
    sleep 1000
    sleep 9999
else
    echo "">/dev/null
fi
debiangroup_add(){
sed -i '$ a\aid_other:20233' $rootfs/etc/group
sed -i '$ a\aid_other:50233' $rootfs/etc/group
}
bash_pather(){
rm -rf $rootfs/bin/sh && ln -s $rootfs/bin/bash $rootfs/bin/sh
}