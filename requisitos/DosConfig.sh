#!/bin/bash

echo "Verifique se tem o Slowloris e o t50 instalados"

sleep 2 

figlet D0S

echo "Escolha uma opção"
menu="
1-Usar Slowloris 
2-Usar t50
"

echo "$menu"

read -p "D0S >> " escolha

case "$escolha" in
	1)
		bash requisitos/slowconfig.sh
	;;

	2)
		bash requisitos/t50config.sh
esac
