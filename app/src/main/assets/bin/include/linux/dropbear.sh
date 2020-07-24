#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
dropbear_start(){
echo "- dropbear::start..."
rm -rf /etc/dropbear && mkdir /etc/dropbear && chmod 0777 /etc/dropbear
dropbearkey -t dss -s 1024 -f /etc/dropbear/dropbear_dss_host_key
dropbearkey -t rsa -s 2048 -f /etc/dropbear/dropbear_rsa_host_key
dropbearkey -t ecdsa -s 521 -f /etc/dropbear/dropbear_ecdsa_host_key
echo "- Tip: 如果卡在这里或无报错,说明已经启动成功"
echo "- SSH Port: 22222"
dropbear -E -p 22222
}
dropbear_stop()
{
echo "- dropbear::stop..."
pkill sh
pkill bash
pkill dropbear
}