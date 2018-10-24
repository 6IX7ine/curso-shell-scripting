#!/bin/bash

convertIMAGEM () {
	echo "Convertendo os arquivos .jpg para .png" 

	sleep 1

	for imagem in *.jpg
	do
		echo "Convertendo a imagem" $imagem

		no_extesion=$(ls $imagem | awk -F . '{print $1}')
		local subshell=$(ls -l | grep $imagem) # Acessivel somente dentro do escopo da função

		convert ~/Área\ de\ Trabalho/scripts/$imagem ~/Área\ de\ Trabalho/scripts/$no_extesion.png
	done

	sleep 1

	if [[ -d output ]]; then
		echo "Diretorio já criado"
	fi

	if [[ ! -d output ]]; then
		echo "Criando o diretorio output"
		mkdir output
	fi


	echo "Movendo os arquivos para pasta output"

	for imagem in *.png 

	do 
		mv $imagem ~/Área\ de\ Trabalho/scripts/output/$imagem
	done

	sleep 1

	rm -rf *.png

	
}

convertIMAGEM 2>erros.logs

if [[ $? -eq 0 ]]; then
	echo "Conversão efetuado com sucesso!" 
fi
