#!/bin/bash

rm index.html

clear

echo "Seu ip: " && curl https://ipapi.co/ip
echo " "
figlet ipinfo
echo "Versão:1.2"

menu="
{0} Sair do script
{1} Rastrar ip
{2} Rastrear seu propio ip
{i} informações do script
"
echo "$menu"
read -p "Escolha uma opção: "  escolha

case "$escolha" in
	1)
		read -p "Digite o ip que você quer rastrear: " ip
		wget https://ipapi.co/$ip/yaml/ -q
		cat index.html
		rm index.html
	;;

	2)
		wget https://ipapi.co/yaml/ -q
		cat index.html
		rm index.html
	;;

	0)
		echo "(^_^)/ tchau"
		exit 1
	;;

	i)
		echo "By: H7X"
		echo "Versão: 1.2"
		echo "Github: https://github.com/H7XX"
		echo "Youtube: https://www.youtube.com/channel/UCKHc3Id634qWSrZ_vbQKGTQ"
	;;

	*)
		echo -e "\e[33m[!]Opção invalida\e[m"

esac
