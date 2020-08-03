#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
dropbear_start(){
echo "- dropbear::start..."
if [ -f "/etc/dropbear/dropbear_dss_host_key" ];then
echo "">/dev/null
else
dropbearkey -t dss -s 1024 -f /etc/dropbear/dropbear_dss_host_key
fi
if [ -f "/etc/dropbear/dropbear_rsa_host_key" ];then
echo "">/dev/null
else
dropbearkey -t rsa -s 2048 -f /etc/dropbear/dropbear_rsa_host_key
fi
if [ -f "/etc/dropbear/dropbear_ecdsa_host_key" ];then
echo "">/dev/null
else
dropbearkey -t ecdsa -s 521 -f /etc/dropbear/dropbear_ecdsa_host_key
fi
echo "- SSH Port: 22222"
dropbear -E -p 22222 &
echo -n ""
}
dropbear_stop()
{
echo "- dropbear::stop..."
pkill sh
pkill ash
pkill fish
pkill zsh
pkill bash
pkill dropbear
}