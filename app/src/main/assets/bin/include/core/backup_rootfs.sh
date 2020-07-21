#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
backup_rootfs(){
echo "- 正在导出系统"
cd $rootfs/
tar zcf backup.tgz *
mv backup.tgz $DATA2_DIR/
echo "- 完成"
echo "  已保存到$DATA2_DIR/中"
echo "  配置文件就是之前安装那个就ok"
}