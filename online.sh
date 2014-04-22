#!/bin/bash
#
# v0.1.2
#
#################################################
#Code Snippit					#
#Muestra Usuarios Concurrentes			#
#Zeuza Server - http://mamalibre.com.ar		#
#Autor http://legadolibre.com.ar/mama21mama	#
#################################################
#
################################################################
# Este programa es software libre; puede redistribuirlo        #
# y/o modificarlo bajo los términos de la GNU General Public   #
# License publicada por la Free Software Foundation; tanto la  #
# versión 2, como (opcionálmente) cualquier versión posterior. #
#							       #
# Este programa se distribuye con la esperanza de que  	       #
# sea útil, pero SIN NINGUNA GARANTÍA; ni siquiera la          #
# garantía implícita de COMERCIALIDAD o                        #
# ADECUACIÓN PARA ALGÚN PROPÓSITO PARTICULAR. 	               #
# Vea la GNU General Public License para más detalles.         #
################################################################
for (( ; ; ))
do
netstat -ant | grep EST |awk '{print($5)}' > /tmp/online
sleep 5s
clear
timestamp() {
  date +"%T %d/%m/%y"
}
timestamp
echo -e "\e[30;48;5;82m usuarios concurrentes\e[0m"
echo -e "\e[30;48;5;82m zeuza server\e[0m"
cat /tmp/online |sort |uniq -c |sort | wc -l > /tmp/online2
DDPATH="$(cat /tmp/online2)"
suma="$DDPATH" 
if (( $suma < 144 )) ; then 			# Poner valor 20 primera vez. Cuando llegue al punto 
	parte="No paso el record.";		# maximo editarlo y reiniciar script. 
elif (( $suma > 144 )) ; then			# Poner valor 20 primera vez.
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