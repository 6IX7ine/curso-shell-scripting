#!/bin/bash


PATH_ACCESS=/var/log/apache2/access.log



regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ -d logs ]]; then
	cd logs/
	if [[ ! -d apache2 ]]; then
		mkdir apache2
		
	fi
fi

cd ..

if [[ $1 =~ $regex ]]; then

	logs=$(cat $PATH_ACCESS | head -n $2 | grep $1)

	if [[ $? -ne 0 ]]; then
		echo "não foi encontrado."
	fi

	echo $logs >> logs/apache2/logs.txt

else
	echo "Formato inválido."
fi
