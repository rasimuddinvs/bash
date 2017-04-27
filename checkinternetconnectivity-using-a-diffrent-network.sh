#!/bin/bash
#### Description: This script is used to check the network connectiving of a remote location which is
#### connected using intranet to our office email alert is set from the main office machine
#### HOSTCHECK= Wan ip of the remote location
#### Machine 192.168.2.250 is the machine in our office with direct Lan/Uniwifi connection to remote office
#### This script if put in cron trigger email when there is packet loss or network disconnection in the 
#### remote office
#### Written by: Rasimuddin V S - rasimuddinvs@gmail.com on 04-2016
HOST=8.8.8.8
HOST_CHECK="xx.xx.xx.xx"
function wan_ip(){
    wget -qO- http://ipecho.net/plain;
    echo
}
function mail_17_down() {
echo "Connection down from xx.xx.xx.xx" | swaks --to ithelp@domain.com,rasim@domain.com --header "Subject: SITE-17-Conn Down"  --body "Conn down from xx.xx.x.xx" --from "site17@domain.com" --server mail.domain.com --auth LOGIN --auth-user "internal@domain.com" --auth-password "rasim*123" -tls
#echo "Connection down to 8.8.8.8" | mail -s "xx.xx.xx.xx is down" rasim@domain.com,rasim@domain.com
}

function mail_packet_loss() {
echo "Packet loss from xx.xx.xx.xx" | swaks --to ithelp@domain.com,rasim@domain.com --header "Subject: SITE-17-Packetloss"  --body "Packet loss from xx.xx.xx.xx" --from "site17@domain.com" --server mail.domain.com --auth LOGIN --auth-user "internal@domain.com" --auth-password "rasim*123" -tls
}


#############Main program#########################
HOST2="$(wan_ip)"
#if [[ "$HOST2" != "$HOST_CHECK" ]]; then
#ssh root@192.168.3.238 -t "$(typeset -f mail_17_down); export -f mail_17_down; mail_17_down"
#exit 1
#fi
ping -c 2 ${HOST} 1>/dev/null
if [ $? -ne 0 ]; then
ssh root@192.168.2.250 -t "$(typeset -f mail_17_down); export -f mail_17_down; mail_17_down"
exit 1
else
RECIVE2=50
RECIVE=$(ping -c 25 ${HOST} | grep packets | cut -d "," -f 2 | awk '{print $1}')
[[ $RECIVE -lt 25 ]] && RECIVE2=$(ping -c 50 ${HOST} | grep packets | cut -d "," -f 2 | awk '{print $1}')
[[ $RECIVE2 -lt 48 ]] && ssh root@192.168.2.250 -t "$(typeset -f mail_packet_loss); export -f mail_packet_loss; mail_packet_loss"
fi
##################################################

