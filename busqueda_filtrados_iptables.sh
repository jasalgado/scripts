#!/bin/bash

# Buscamos puertos filtrados por iptables de entre los puertos a la escucha en local
RUTA_LOG=/var/log/messages

for puertoProt in $(netstat --inet -nlut | awk '/^(tcp|udp)/ { gsub(/[0-9.]*:/,""); print toupper($1) "|" $4 }');
do
        protocolo=$(echo $puertoProt | cut -f1 -d "|" )
        puerto=$(echo $puertoProt | cut -f2 -d "|" )

        grep -qEo " PROTO=$protocolo .* DPT=$puerto " $RUTA_LOG;

        if [ $? -eq 0 ];
        then
                echo "Se filtra $puerto de $protocolo" 
        fi
done;

