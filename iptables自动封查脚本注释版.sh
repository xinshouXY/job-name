[root@nginx-8 ~]# cat drop_ip3.sh 
#!/bin/bash

. /etc/init.d/functions

conut=100 #访问次数的阀值，超过10次就禁止掉这个IP
Path=/server/scripts/access.log
function ipt(){ #iptables 的设置
    awk  '{print $1}'$Path|sort|uniq -c|sort -rn >/tmp/tmp.log #统计IP访问次数
    exec < /tmp/tmp.log
    while read line
    do
        ip=echo $line|awk '{print $2}'
        if [ echo $line|awk '{print $1}' -ge $conut -a iptables -L -n|grep "$ip"|wc -l -lt 1 ]
	#如果IP访问次数大于等于10并且在iptables禁止列表里没有这个IP。
        then
            iptables -I INPUT -s $ip -j DROP
	    #把这个IP写进iptables禁止列表里
            RETVAL=$?
            if [ $RETVAL -eq 0 ]
 	    #如果上一条命令执行没有出错
            then
                action "iptables -I INPUT -s $ip -j DROP" /bin/true
                echo "$ip" >>/tmp/ip_$(date +%F).log
		#把这个ip写进一个IP地址黑名单
            else
                action "iptables -I INPUT -s $ip -j DROP" /bin/false
            fi
        fi
    done
}

function del(){
[ -f /tmp/ip_$(date +%F -d '-1 day').log ]||{
    #如果存在这个黑名单日志
    echo "log is not exist"
    exit 1} 
    exec </tmp/ip_$(date +%F -d '-1 day').log
    while read line
    do
        if [ iptables -L -n|grep "$line"|wc -l -ge 1 ]
	#如果IP地址存在黑名单里
        then
            iptables -D INPUT -s $line -j DROP
	    #就把他放出来
        fi
    done
}

function main(){
    flag=0
    #计数器
    while true
    do
        sleep 180
	#180秒运行一次下面的命令
        ((falg++))
	#每执行一次，计数器自动加上1
        ipt
        [ $flag -ge 480 ] && del && flag=0
	#超过1天的时候，就把黑名单里的IP给放出来并且把计数器归零
    done
}
main
