# dogeland cli module
#
# license: gpl-v3
vncserver_start(){
echo "- vncserver::start..."
echo "- Port: 111111"
vncserver :11111 &
}
vncserver_stop()
{
echo "-vncserver::stop..."
vncserver -kill :11111
pkill vncserver
}