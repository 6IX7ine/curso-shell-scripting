#!/bin/bash


PATH_ACCESS=/var/log/apache2/access.log



if [[ -z $1 ]]; then
	while [[ -z $requisicao ]]; do
		read -p "(GET,PUT,POST or DELETE): " requisicao
	done	
fi

toUpperLetra=$(echo $requisicao | awk '{print toupper($requisicao)}')

case $toUpperLetra in
	GET )
	cat $PATH_ACCESS | grep 'GET'
		;;	
	POST )
	cat $PATH_ACCESS | grep 'POST'
		;;
esac