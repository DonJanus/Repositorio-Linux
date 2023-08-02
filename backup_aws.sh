#!/bin/bash

caminho_arquivo=/home/[nome do seu user]/backup_db
cd $caminho
data=$( date %F )
#solicitando a impressão da data completa
if [! -d $data]
then
  mkdir $data
fi

tabelas=$(mysql -u root [nome da base] -e "show tables;" | grep -v Tables)
#-v exclui a palavra que especificamos e imprime todo o resto
for tabela in tabelas
do



