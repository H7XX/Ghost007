#!/bin/bash

chmod +x creat-backdoor/back.sh

echo "Você ja tem o metasploit instalado?"
read -p "s/n >> " p1
case "$p1" in
	s)
		echo "instalando..."
		apt-get install figlet dex2jar -y
		clear
	;;

	n)
		echo "instalando..."
		apt-get install figlet dex2jar metasploit-framework -y
                clear
	;;
esac
