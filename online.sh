#!/bin/bash
#
# v0.1.1
#
#################################################
#Code Snippit									#
#Muestra Usuarios Concurrentes					#
#Zeuza Server - http://mamalibre.com.ar			#
#Autor http://legadolibre.com.ar/mama21mama		#
#################################################
for (( ; ; ))
do
netstat -ant |grep 13 |grep EST |awk '{print($5)}' > /tmp/online
netstat -ant |grep 20 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 21 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 80 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 443 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 2323 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 3306 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 5222 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 5269 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 5280 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 6667 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 8000 |grep EST |awk '{print($5)}' >> /tmp/online
netstat -ant |grep 61941 |grep EST |awk '{print($5)}' >> /tmp/online 
sleep 5s
clear
# Define a timestamp function
timestamp() {
  date +"%T %d/%m/%y"
}
# do something...
timestamp # print timestamp
echo -e "\e[30;48;5;82m usuarios concurrentes\e[0m"
echo -e "\e[30;48;5;82m zeuza server\e[0m"
cat /tmp/online |sort |uniq -c |sort | wc -l > /tmp/online2
DDPATH="$(cat /tmp/online2)"
suma="$DDPATH" 
if (( $suma < 144 )) ; then
	parte="No paso el record.";
elif (( $suma > 144 )) ; then
    cat /tmp/online2 > /tmp/online_record
    record="$(cat /tmp/online_record)"
	parte="Yes, paso el record.";
else
	parte="recalculando";
	fi
echo "Online:. $suma"
echo "$parte"
echo "Record:. $record"
done
