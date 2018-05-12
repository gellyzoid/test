apt-get -y -f update && apt-get -y -f upgrade && apt-get -y -f install nano && apt-get -y -f install wget && apt-get -y -f install vim



apt-get -y install wget curl gcc make wget tzdata git libreadline-dev libncurses-dev libssl-dev zlib1g-dev




apt-get install upstart


apt-get install checkinstall build-essential -y



wget http://www.softether-download.com/files/softether/v4.27-9666-beta-2018.04.21-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.27-9666-beta-2018.04.21-linux-x64-64bit.tar.gz

tar xvfz softether-vpnserver-v4.27-9666-beta-2018.04.21-linux-x64-64bit.tar.gz


cd
ls -a
cd vpnserver/
ls -a
make


press 1 to all hit enter





cd ..
mv vpnserver/ /usr/local/
cd /usr/local/vpnserver/
chmod 600 * /usr/local/vpnserver
chmod 755 /usr/local/vpnserver/vpncmd
chmod 755 /usr/local/vpnserver/vpnserver
chmod +x vpnserver
chmod +x vpncmd
cd




Code:


nano -w /etc/init.d/vpnserver


paste this code



#!/bin/sh
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
exit 0


CTRL + X type Y hit ENTER





chmod +x /etc/init.d/vpnserver




nano -w /etc/sysctl.conf



Change

#net.ipv4.ip_forward=1

to

net.ipv4.ip_forward=1

CTRL + X then type Y then hit enter


then paste this command

echo 1 > /proc/sys/net/ipv4/ip_forward

then

sysctl --system




/etc/init.d/vpnserver restart


/etc/init.d/vpnserver start



/usr/local/vpnserver/vpncmd

type "1" and hit Enter three times




ServerPasswordSet

hubdelete DEFAULT

HubCreate VPN

hublist

BridgeCreate /DEVICE:"soft" /TAP:yes PHC

Hub VPN

UserCreate test

UserPasswordSet test

IPsecEnable
Yes
No
Yes
menin
PHC

ServerCertRegenerate <YOUR SERVER IP or FQDN>

ServerCertGet ~/cert.cer

SstpEnable yes

Hub

VpnOverIcmpDnsEnable /ICMP:yes /DNS:yes RESTART PUTTY

service vpnserver start

then

reboot

then

exit

then

logout putty

then open

《《SE VPN BRIDGE FOR PC WINDOWS》》



DIRECT LINK HERE FOR

SE VPN BRIDGE MANAGER FOR PC WINDOWS

http://www.softether-download.com/f...666-beta-2018.04.21-windows-x86_x64-intel.exe



tap ADD NEW CONNECTION


login VPS credentials 


boom one click connect


then send screenshot


Ok na sir no need na client manager download kana agad ng kung ano gusto mo at wag kalimutan screenshot ng speedtest.net o fast.com at torrent unlimited downloads pa screenshot ng transfer rates at pwedi kana mag lapag ng server kay thread ni Captain Underpants




click Local Bridge Setting . Then a new window will appear. Fill in the following: 
Virtual HUB : VPN.
Type To Create : Bridge With New Tap Device. 
New Tap Device Name : soft 
If you have click Create Local Bridge Setting . then close settings then connect check your speed test send screenshot!