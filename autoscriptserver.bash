#!/bin/bash
apt-get -y -f update && apt-get -y -f upgrade && apt-get -y -f install nano && apt-get -y -f install wget && apt-get -y -f install vim
apt-get -y install wget curl gcc make wget tzdata git libreadline-dev libncurses-dev libssl-dev zlib1g-dev
apt-get install upstart
apt-get install checkinstall build-essential -y
sleep 2
wget -O softether-vpn-4-25.tar.gz http://softether-download.com/files/softether/v4.25-9656-rtm-2018.01.15-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.25-9656-rtm-2018.01.15-linux-x64-64bit.tar.gz
tar -xzf softether-vpn-4-25.tar.gz
cd vpnserver
echo "Please press 1 for all the following questions."
sleep 1
make
cd ..
mv vpnserver /usr/local/
chmod 600 * /usr/local/vpnserver
chmod 755 /usr/local/vpnserver/vpncmd
chmod 755 /usr/local/vpnserver/vpnserver
chmod +x vpnserver
chmod +x vpncmd
echo '#!/bin/sh
# chkconfig: 2345 99 01
# description: SoftEther VPN Server
DAEMON=/usr/local/vpnserver/vpnserver
LOCK=/var/lock/subsys/vpnserver
test -x $DAEMON || exit 0
case "$1" in
start)
$DAEMON start
mkdir -p /var/lock/subsys
touch $LOCK
;;
stop)
$DAEMON stop
rm $LOCK
;;
restart)
$DAEMON stop
sleep 3
$DAEMON start
;;
*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac
exit 0' > /etc/init.d/vpnserver
echo "System daemon created. Registering changes..."
sleep 2
chmod 755 /etc/init.d/vpnserver
update-rc.d vpnserver defaults
echo "SoftEther VPN Server should now start as a system service from now on. Starting SoftEther VPN service..."
../etc/init.d/vpnserver start
esac