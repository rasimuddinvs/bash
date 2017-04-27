#!/bin/bash
#### Description: This was a bash script i created when odesk was started 
#### for one of my collegue to apply for the interviews fast
#### This used to work earlier. But i think odesk/upwork has taken precausion 
#### to prevent these kinds of script now.
#### Written by: Rasimuddin V S - rasimuddinvs@gmail.com on 05-2014
wget -q --user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -O /tmp/more.txt "https://www.odesk.com/jobs/rss?t[]=0&t[]=1&dur[]=0&dur[]=1&dur[]=13&dur[]=26&dur[]=none&wl[]=10&wl[]=30&wl[]=none&tba[]=0&tba[]=1-9&tba[]=10-&exp[]=1&exp[]=2&exp[]=3&amount[]=Min&amount[]=Max&q=Linux+OR+install+OR+cpanel+OR+Plesk&sortBy=s_ctime+desc"
sleep 80
[[ -s /tmp/more.txt ]] || exit 0
grep '<title><!' /tmp/more.txt | sed s/CDATA//g | sed s/title//g|  tail -10| sed s/^............//g |sed s/......$//g > /tmp/tmp1.txt
cat /tmp/tmp1.txt
cat /tmp/more.txt > /tmp/job-desc.txt
cat /tmp/tmp1.txt > /tmp/more.txt
cat /tmp/tmp1.txt >> /tmp/jobs.txt
DIFF=$(diff /tmp/more.txt /tmp/more1.txt | grep "^<")
[[ -z $DIFF ]] || echo $DIFF | tee -a /home/rzm/jobs.odesk.txt | wall
cat /tmp/more.txt > /tmp/more1.txt
>/tmp/more.txt
