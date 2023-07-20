#!/bin/bash

converte_imagem(){
        local caminho_imagem=$1
        local imagem_semex=$(ls $caminho_imagem | awk -F. '{print $1}')
        convert $imagem_semex.jpg $imagem_semex.png
}
varrer_diretorio(){

        cd $1
        for arquivo in *
        do
                caminho_arquivo=$(find ~/imagens-livros -name $arquivo)
                if [ -d $caminho_arquivo ]
                then
                        varrer_diretorio $caminho_arquivo
                else

                        converte_imagem $caminho_arquivo
                fi
        done

}

varrer_diretorio ~/imagens-livros
if [ $? -eq 0 ]
then 
        echo 'conversao ok'
else 
        echo 'falha'
fi

