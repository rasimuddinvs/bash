#!/bin/bash
####
#### Written by: Rasimuddin V S - rasimuddinvs@gmail.com on 04-2016


rsync -avzop --progress --stats -e "ssh" /Raid_Mount/IT_Share/ root@192.168.1.250:/Raid_Mount/IT_Share/  



if [[ $? == 0 ]]; then

STATUS_2="COMPLETED vhosts RSYNC"

echo -e "`date`\n02 = $STATUS_2 \n" | mail -s "IT_Temp sync from share17 to share16 Success" monitor@rasim.in



else

STATUS_3="vhosts RSYNC FAILED"



echo -e "`date`\n03 = $STATUS_3 \n" | mail -s "IT_Temp sync from share17 to share16 Failed" monitor@rasim.in

fi
