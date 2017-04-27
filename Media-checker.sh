#!/bin/bash
#### This simple script will monitor for sharing of any illegal video contents and report as email
#### Only the location to check need to be specified when giving in cron
#### Written by: Rasimuddin V S - rasimuddinvs@gmail.com on 04-2016
LOCATION_CHECK=$1
find ${LOCATION_CHECK} -type f | egrep "[.]exe|[.]mp4|[.]m4a|[.]m4v|[.]3gp|[.]3g2|[.]avi|[.]asf|[.]wma|[.]wmv|[.]mp3|[.]mid|[.]wav|[.]amr" | mail -s EXE_Media_files_in_$(hostname) ithelp@<domainname>
