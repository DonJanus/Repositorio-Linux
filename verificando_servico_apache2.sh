#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
if [ $resposta_http -eq 200 ]
#Funcao -eq so compara valores inteiros, em caso de string utilizar "=="
then 
	echo "Servidor online!"
else
	echo "Houve um problema com o servidor. Tentando reiniciar"
	systemctl restart apache2
	echo "...Servidor reinicializando"
fi
