#!/bin/bash
#live hosts scanner

ip=`sudo route -n | grep 255 | cut -d' ' -f1`
ip2=${ip::-2}
count=1

while [ $count -le 254 ]
do 
	alive=`ping -c 1 $ip2.$count`
	png=`ping -c 1 $ip2.$count | grep -o "1 received"`
	eq=`[[ $png = "1 received" ]] && echo 1 || echo 0`
	
	if [ $eq -ge 1 ];then
		echo $ip2.$count Up
	elif [ $eq -ge 0 ];then
		echo $ip2.$count Down
	else
		echo error

	fi
	((count++))
done

