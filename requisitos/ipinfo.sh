#!/bin/bash

figlet ipinfo

menu="
{1} ver seu propio ip
{2} rastrear ip
"
echo "$menu"
read -p "Escolha uma opção: " escolha

case "$escolha" in
	1)
		curl ipinfo.io/what-is-my-ip
	;;

	2)
		read -p "ip: " ip
		curl ipinfo.io/$ip
	;;

esac
