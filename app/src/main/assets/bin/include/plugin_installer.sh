plugin_installer(){
echo "- 正在解压"
if [ ! $file2 ];then
unzip $file -d $START_DIR/
else
unzip $file2 -d $START_DIR/
fi
echo "- 正在安装"
. $START_DIR/install.sh
rm $START_DIR/install.sh
echo "- 安装成功"
}