yes(){
echo "正在启动Bootstrap..."
sleep 1
bootstrap=$TOOLKIT/bootstrap
ssh=$bootstrap/ssh/status.txt
service=$bootstrap/service/status.txt
$bootstrap/system/main.sh
$bootstrap/ssh/main.sh $ssh
$bootstrap/service/main.sh $service
$bootstrap/xfcevnc/main.sh
}
no(){
sleep 1
}
$@