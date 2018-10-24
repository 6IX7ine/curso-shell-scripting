#!/bin/bash


PATH_FILE=/var/log/apache2/access.log

local=$(awk '{print $1}' $PATH_FILE)

users=$(awk '/fabio|root/' /etc/passwd)



echo $local, $users


