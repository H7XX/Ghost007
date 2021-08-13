#!/bin/bash

echo "instalando. . ."

sudo apt-get install figlet curl nmap grep t50 php pip python python2 python3 aircrack-ng zenity hydra -y

pip install pynput
pip install slowloris

chmod +x Ghost007.sh
cd requisitos/
chmod +x *
chmod +x creat-backdoor/back7.sh
cd ..

echo "Instalação das requisições completa"

zenity --info --title="Finalizada" --text="Instalação completa clique em ok para continuar"
