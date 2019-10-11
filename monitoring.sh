#!/bin/bash
#Author: MoWenJie
#Date: 2019/07/09
#Description: This script is used to monitor the use of local system resources

ip_addr(){
IP=$(curl -s ip.sb)
}
host_name(){
HOST=$(hostname)
}
network_check(){
ping -c 3 www.baidu.com > /dev/null 2>&1
if [ $? -eq 0 ];then
NETWORK="The network is available"
else
NETWORK="Network is not available"
fi
}
system_product(){
SN=$(dmidecode -s system-product-name)
}
os(){
OS=$(awk -F '[ .]' '{print $1,$3,$4"."$5}' /etc/redhat-release)
}
load_usage(){
LOAD=$(uptime | awk '{print $NF}')
}
cpu_usage(){
CPU=$(top -n 1 |grep Cpu | awk '{print $2+$4}')
}
disk_usage_root(){
DIST_ROOT=$(df -TH | grep '/$' | awk '{print $(NF-1)}')
}
disk_usage_data(){
DISK_DATA=$(df -TH | grep '/data$' |awk '{print $(NF-1)}')
}
mem_usage(){
MEM1=$(free | grep Mem |awk '{print $3/$2*100}')
MEM2=${MEM1%.*}
}
swap_usage(){
SWAP_USED=`free -m | grep -w "^Swap" | awk '{print$3}'`
SWAP_TOTAL=`free -m | grep -w "^Swap" | awk '{print$2}'`
if [ ${SWAP_TOTAL} -eq 0 ];then
SWAP_USAGE=0
elif [ $SWAP_USED -eq 0 ];then
SWAP_USAGE=0
else
SWAP_USAGE=$(echo "${SWAP_USED} ${SWAP_TOTAL}" | awk '{print $1/$2*100}')
fi
}
main(){
ip_addr
host_name
network_check
system_product
os
load_usage
cpu_usage
mem_usage
swap_usage
disk_usage_root
disk_usage_data
}
main
echo -e "---Monitoring system resources Date:$(date +%F-%T)---
IP					:\t$IP
Hostname				:\t$HOST
Network traffic				:\t$NETWORK
SN					:\t$SN
OS					:\t$OS
Load average				:\t$LOAD
CPU usage				:\t$CPU%
Memory usage				:\t$MEM2%
swap usage				:\t$(echo ${SWAP_USAGE} | cut -c 1-3)%
disk usage /				:\t$DIST_ROOT	
disk usage data				:\t$DISK_DATA"
