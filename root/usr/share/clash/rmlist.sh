#!/bin/bash /etc/rc.common
. /lib/functions.sh

name=$(uci get clash.config.config_name_remove 2>/dev/null)
check_match_name=$(grep -F "$name" "/usr/share/clashbackup/confit_list.conf") 
line_no=$(grep -n "$check_match_name" /usr/share/clashbackup/confit_list.conf |awk -F ':' '{print $1}')
if [ ! -z $check_match_name ];then
sed -i "${line_no}d" /usr/share/clashbackup/confit_list.conf
sed -i '/^$/d' /usr/share/clashbackup/confit_list.conf	
fi	 

