#!/bin/bash

echo "Digite login dos equipamentos:"
read login
echo "Digite senha dos equipamentos:"
read senha
echo "Bloco de rede, exemplo 192.168.1"
read rede
echo "Primeiro ip da rede digitada acima, exemplo 0"
read ip
echo "Ultimo ip da rede, exemplo 255"
read uip
echo "Porta atual de acesso SSH, exemplo 22"
read port


uip=`expr $uip + 1`
while [ "$ip" -lt "$uip" ]; do
        sshpass -p $senha ssh -p$port -o UserKnownHostsFile=/dev/null -oConnectTimeout=10 -oStrictHostKeyChecking=no $login@$rede.$ip "trigger_url https://raw.githubusercontent.com/bgpconsultoria/scripts-ubnt/script/alteraportas.sh | sh"&
        ip=`expr $ip + 1`
done
