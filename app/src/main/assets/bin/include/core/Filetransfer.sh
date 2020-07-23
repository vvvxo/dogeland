file_send(){
echo "正在发送 $file 到 /file"
mv $file $rootfs/file/
echo "发送成功"
}
file_receive(){
echo "正在接收 /file 中的所有文件"
echo "保存到  $DATA2_DIR/file/"
mv $rootfs/file/ $DATA2_DIR/file/
}