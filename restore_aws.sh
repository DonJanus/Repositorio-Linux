#!/bin/bash
#passar o nome da tabela na entrada do comando

caminho_restore=/home/[seu usuario]/restore_db
#criar o diretorio anteriormente
data=$(read "Qual a data do seu restore(utilizar formato Ano-mes-dia): ")
aws s3 sync s3://[nome do seu bucket]/$data $caminho_restore


cd $caminho_restore
if[ -f $1.sql ]
then
	mysql -u root [nome do banco] < $1.sql
	if [ $? -eq 0 ]
	then
		echo "O restore foi realizado com sucesso"
	fi
else
	echo "O arquivo procurado nao existe no diretorio"
fi
