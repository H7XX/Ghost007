#!/bin/bash
#feito por H7X
#essa ferramenta faz um scan no ip que vc escolher
menu="
S/N"

figlet scanport
echo "version:1.1"

read -p "ip: " ip

echo "fazendo scan. . . "
nmap -sV -A -sS -vv $ip | grep "Discovered open port"

echo "deseja ver mais detalhes sobre alguma porta aberta?"
echo "$menu"
read -p "Escolha uma opção: " opcao

case "$opcao" in 
	S)
		read -p "porta: " porta
		nmap -sV -p $port $ip | grep "tcp open "

	;;

	N)
		exit 1
	;;
esac
