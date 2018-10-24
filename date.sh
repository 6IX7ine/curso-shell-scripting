#!/bin/bash

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

if [[ ! -d logs ]]; then
	mkdir logs
fi

for pid in $processos

	do
		nome_processo=$(ps -p $pid -o comm=)
		tamanho_processo=$(ps -p $pid -o size | grep [0-9] )

		echo -n $(date +%F,%H:%M:%S,) >> logs/$nome_processo.logs
		echo -n $(ps -ef | head -n 5) >> logs/$nome_processo.logs
		
	done
