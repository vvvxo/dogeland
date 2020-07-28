#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
sshd_start()
{
echo "- sshd::start..."
if [ $(ls "/etc/ssh/" | grep -c key) -eq 0 ]; then
   ssh-keygen -A >/dev/null
fi
rm -rf /run/sshd
rm -rf /var/run/sshd
mkdir /run/sshd /var/run/sshd
ssh-keygen -A
chmod 555 /run/sshd
echo "- Tip: 如果卡在这里或无报错,说明已经启动成功"
echo "- SSH Port: 22222"
/usr/sbin/sshd -p 22222
}
sshd_stop()
{
echo "- sshd::stop..."
kill -9 /run/sshd.pid /var/run/sshd.pid
pkill sshd
}