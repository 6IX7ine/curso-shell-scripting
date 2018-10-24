#!/bin/bash

status=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost | grep [0-9]) 

if [[ $status -eq 200 ]]; then
	echo "status: 200"
else
	echo "status: Error"
	mail -s "Problema no servidor" jorgeisleihenriquejunior@gmail.com
	systemctl restart apache2
	echo "Restart apache2 server"
fi

