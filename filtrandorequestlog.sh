#!/bin/bash

cd ~/apache-log
if [ -z $1 ]
then
	while [ -z $requisicao ]
 	#-z verifica se a entrada está vazia.
	do
		read -p "Voce esqueceu de colocar o parametro: " requisicao
  		#read é usado para receber um input do usuario
		letra_maiuscula=$(echo $requisicao | awk '{print toupper($1)}')
	done
else
	letra_maiuscula=$(echo $1 | awk '{print toupper($1)}')
fi

case $letra_maiuscula in
	GET)
	cat apache.log | grep GET
	;;

	POST)
	cat apache.log | grep POST
	;;

	PUT)
	cat apache.log | grep PUT
	;;

	DELETE)
	cat apache.log | grep DELETE
	;;

	*)
	echo "Parametro invalido"
	;;

esac
	
