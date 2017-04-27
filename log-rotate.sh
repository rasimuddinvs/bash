#!/bin/bash
#
#

function help() {
echo "Usage : `basename $0` <Directory to log>"

}

function main() {

FORTIGATE_LOGS=${1}
FORTIGATE_LOGS_OLD="${FORTIGATE_LOGS}/logs-old"
AGE_COMPRESS=2
mkdir -pv ${FORTIGATE_LOGS_OLD};
cd ${FORTIGATE_LOGS};
COMPRESS_LIST="$(sudo find . -maxdepth 1 -mtime +${AGE_COMPRESS} -type f -print)";
[[ -n "${COMPRESS_LIST}" ]] && \
{
   sudo tar -cvzf  ${FORTIGATE_LOGS_OLD}/logs-$(date +%F_%H).tar.gz ${COMPRESS_LIST}
   rm -rfv ${COMPRESS_LIST};
} || echo 1>&2 "No  logs files to compress ..."
    
}

##Main script
#==============================


[[  $# > 0 ]] || { help ;exit 1; }
main $@

