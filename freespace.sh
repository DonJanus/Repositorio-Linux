#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
#-i utilizado para ignorar case
relacao_memoria_atual=$(bc<<< "scale=2;$memoria_consumida/$memoria_total *100"|awk  -F. '{ print $1}')

if [ $relacao_memoria_atual -gt 50 ]
#-gt = greater than 
then
	echo $date >> ~/log.txt
else
	echo "Tudo está certo!" >> ~/log.txt 
fi
